# ============================================================================
# SCRIPT DE OPTIMIZACIÓN DE IMÁGENES - La Arenilla
# ============================================================================
# Uso: Ejecutar en PowerShell desde la carpeta del proyecto
# Requisito: ImageMagick instalado (https://imagemagick.org/script/download.php)
# ============================================================================

# Configuración
$carpetaOrigen = "D:\ARENILLA\assets\images"
$carpetaDestino = "D:\ARENILLA\assets\images\optimizadas"
$anchoMaximo = 1200
$calidadJPEG = 82

# Colores para output
function Write-Color($text, $color) {
    Write-Host $text -ForegroundColor $color
}

# Banner
Write-Host ""
Write-Color "============================================" "Cyan"
Write-Color "   OPTIMIZADOR DE IMAGENES - La Arenilla   " "Cyan"
Write-Color "============================================" "Cyan"
Write-Host ""

# Verificar ImageMagick
$magick = Get-Command magick -ErrorAction SilentlyContinue
if (-not $magick) {
    Write-Color "ERROR: ImageMagick no esta instalado." "Red"
    Write-Host ""
    Write-Host "Para instalar ImageMagick:"
    Write-Host "1. Descarga desde: https://imagemagick.org/script/download.php"
    Write-Host "2. Ejecuta el instalador (elige la version Q16-HDRI)"
    Write-Host "3. IMPORTANTE: Marca la opcion 'Add to PATH'"
    Write-Host "4. Reinicia PowerShell y ejecuta este script de nuevo"
    Write-Host ""
    Write-Color "Alternativa rapida con winget:" "Yellow"
    Write-Host "   winget install ImageMagick.ImageMagick"
    Write-Host ""
    exit 1
}

Write-Color "OK ImageMagick detectado" "Green"
Write-Host ""

# Crear carpeta de destino
if (-not (Test-Path $carpetaDestino)) {
    New-Item -ItemType Directory -Path $carpetaDestino -Force | Out-Null
    Write-Color "OK Carpeta creada: $carpetaDestino" "Green"
}

# Obtener imagenes JPEG
$imagenes = Get-ChildItem -Path $carpetaOrigen -Filter "*.jpeg" -File
$imagenes += Get-ChildItem -Path $carpetaOrigen -Filter "*.jpg" -File

if ($imagenes.Count -eq 0) {
    Write-Color "No se encontraron imagenes JPEG en $carpetaOrigen" "Yellow"
    exit 0
}

Write-Host "Encontradas $($imagenes.Count) imagenes para optimizar"
Write-Host "Configuracion: ${anchoMaximo}px maximo, calidad ${calidadJPEG}%"
Write-Host ""

# Contadores
$totalOriginal = 0
$totalOptimizado = 0
$procesadas = 0

# Procesar cada imagen
foreach ($img in $imagenes) {
    $nombreArchivo = $img.Name
    $rutaOrigen = $img.FullName
    $rutaDestino = Join-Path $carpetaDestino $nombreArchivo
    
    # Tamano original
    $tamanoOriginal = $img.Length
    $totalOriginal += $tamanoOriginal
    
    Write-Host "[$($procesadas + 1)/$($imagenes.Count)] $nombreArchivo" -NoNewline
    
    # Comando ImageMagick para optimizar
    # -resize: redimensiona si es mayor al ancho maximo (mantiene proporcion)
    # -quality: calidad JPEG
    # -strip: elimina metadata EXIF innecesaria
    # -sampling-factor: submuestreo de color para mejor compresion
    # -interlace Plane: JPEG progresivo (carga gradual)
    
    $argumentos = @(
        $rutaOrigen,
        "-resize", "${anchoMaximo}x>",
        "-quality", $calidadJPEG,
        "-strip",
        "-sampling-factor", "4:2:0",
        "-interlace", "Plane",
        "-colorspace", "sRGB",
        $rutaDestino
    )
    
    try {
        & magick @argumentos 2>$null
        
        if (Test-Path $rutaDestino) {
            $tamanoNuevo = (Get-Item $rutaDestino).Length
            $totalOptimizado += $tamanoNuevo
            $reduccion = [math]::Round((1 - $tamanoNuevo / $tamanoOriginal) * 100, 1)
            
            $colorReduccion = if ($reduccion -gt 50) { "Green" } elseif ($reduccion -gt 25) { "Yellow" } else { "White" }
            
            Write-Host " -> " -NoNewline
            Write-Host "$([math]::Round($tamanoOriginal/1KB))KB" -NoNewline -ForegroundColor DarkGray
            Write-Host " -> " -NoNewline
            Write-Host "$([math]::Round($tamanoNuevo/1KB))KB" -NoNewline -ForegroundColor White
            Write-Host " (-${reduccion}%)" -ForegroundColor $colorReduccion
            
            $procesadas++
        } else {
            Write-Color " ERROR" "Red"
        }
    } catch {
        Write-Color " ERROR: $_" "Red"
    }
}

# Resumen final
Write-Host ""
Write-Color "============================================" "Cyan"
Write-Color "                 RESUMEN                    " "Cyan"
Write-Color "============================================" "Cyan"
Write-Host ""
Write-Host "Imagenes procesadas: $procesadas de $($imagenes.Count)"
Write-Host ""
Write-Host "Tamano original:   $([math]::Round($totalOriginal/1MB, 2)) MB"
Write-Host "Tamano optimizado: $([math]::Round($totalOptimizado/1MB, 2)) MB"

$reduccionTotal = [math]::Round((1 - $totalOptimizado / $totalOriginal) * 100, 1)
Write-Color "Reduccion total:   ${reduccionTotal}%" "Green"

Write-Host ""
Write-Host "Archivos guardados en:"
Write-Color $carpetaDestino "Yellow"
Write-Host ""

# Siguiente paso
Write-Color "SIGUIENTE PASO:" "Cyan"
Write-Host "Revisa las imagenes optimizadas y luego copialas a:"
Write-Host "D:\ARENILLA\docs\assets\img\galeria\"
Write-Host ""
