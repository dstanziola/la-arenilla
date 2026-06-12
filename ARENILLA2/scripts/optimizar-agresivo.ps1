# ============================================================================
# SCRIPT DE OPTIMIZACIÓN AGRESIVA - WebP + JPEG reducido
# ============================================================================
# Genera versiones WebP (moderno) y JPEG comprimido (fallback)
# ============================================================================

$carpetaOrigen = "D:\ARENILLA\assets\images"
$carpetaDestino = "D:\ARENILLA\assets\images\optimizadas_v2"
$anchoMaximo = 1000
$calidadJPEG = 72
$calidadWebP = 75

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   OPTIMIZACION AGRESIVA - La Arenilla     " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Verificar ImageMagick
if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: ImageMagick no instalado. Ejecuta: winget install ImageMagick.ImageMagick" -ForegroundColor Red
    exit 1
}

# Crear carpetas
$carpetaJPEG = Join-Path $carpetaDestino "jpeg"
$carpetaWebP = Join-Path $carpetaDestino "webp"
New-Item -ItemType Directory -Path $carpetaJPEG -Force | Out-Null
New-Item -ItemType Directory -Path $carpetaWebP -Force | Out-Null

# Obtener imagenes
$imagenes = Get-ChildItem -Path $carpetaOrigen -Filter "*.jpeg" -File
$imagenes += Get-ChildItem -Path $carpetaOrigen -Filter "*.jpg" -File

Write-Host "Procesando $($imagenes.Count) imagenes..."
Write-Host "Config: ${anchoMaximo}px, JPEG ${calidadJPEG}%, WebP ${calidadWebP}%"
Write-Host ""

$totalOriginal = 0
$totalJPEG = 0
$totalWebP = 0

foreach ($img in $imagenes) {
    $nombre = [System.IO.Path]::GetFileNameWithoutExtension($img.Name)
    $totalOriginal += $img.Length
    
    Write-Host "[$($imagenes.IndexOf($img) + 1)/$($imagenes.Count)] $($img.Name)" -NoNewline
    
    # JPEG optimizado
    $rutaJPEG = Join-Path $carpetaJPEG "$nombre.jpg"
    & magick $img.FullName -resize "${anchoMaximo}x${anchoMaximo}>" -quality $calidadJPEG -strip -sampling-factor "4:2:0" -interlace Plane $rutaJPEG 2>$null
    
    # WebP
    $rutaWebP = Join-Path $carpetaWebP "$nombre.webp"
    & magick $img.FullName -resize "${anchoMaximo}x${anchoMaximo}>" -quality $calidadWebP -define webp:method=6 $rutaWebP 2>$null
    
    if ((Test-Path $rutaJPEG) -and (Test-Path $rutaWebP)) {
        $tamJPEG = (Get-Item $rutaJPEG).Length
        $tamWebP = (Get-Item $rutaWebP).Length
        $totalJPEG += $tamJPEG
        $totalWebP += $tamWebP
        
        Write-Host " -> JPEG: $([math]::Round($tamJPEG/1KB))KB, WebP: $([math]::Round($tamWebP/1KB))KB" -ForegroundColor Green
    } else {
        Write-Host " ERROR" -ForegroundColor Red
    }
}

# Resumen
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "                RESUMEN                     " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Original:     $([math]::Round($totalOriginal/1MB, 2)) MB"
Write-Host "JPEG opt:     $([math]::Round($totalJPEG/1MB, 2)) MB (-$([math]::Round((1-$totalJPEG/$totalOriginal)*100))%)" -ForegroundColor Yellow
Write-Host "WebP:         $([math]::Round($totalWebP/1MB, 2)) MB (-$([math]::Round((1-$totalWebP/$totalOriginal)*100))%)" -ForegroundColor Green
Write-Host ""
Write-Host "Archivos en:" -ForegroundColor Cyan
Write-Host "  JPEG: $carpetaJPEG"
Write-Host "  WebP: $carpetaWebP"
Write-Host ""
Write-Host "RECOMENDACION: Usa WebP con fallback JPEG en el HTML" -ForegroundColor Yellow
Write-Host ""
