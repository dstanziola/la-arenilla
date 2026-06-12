# ============================================================================
# ORGANIZAR Y OPTIMIZAR IMÁGENES - images2
# La Arenilla - Febrero 2026
# ============================================================================
# Procesa las fotos seleccionadas de images2:
# 1. Renombra (corrige typos y espacios)
# 2. Optimiza con ImageMagick
# 3. Organiza por categoría
# ============================================================================

$carpetaOrigen  = "D:\ARENILLA\assets\images2"
$carpetaDestino = "D:\ARENILLA\assets\images2\optimizadas"
$anchoMaximo    = 1200
$calidadJPEG    = 82

function Write-Color($text, $color) { Write-Host $text -ForegroundColor $color }

Write-Host ""
Write-Color "============================================" "Cyan"
Write-Color "   ORGANIZAR IMAGES2 - La Arenilla         " "Cyan"
Write-Color "============================================" "Cyan"
Write-Host ""

# Verificar ImageMagick
if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
    Write-Color "ERROR: ImageMagick no detectado. Instalar con: winget install ImageMagick.ImageMagick" "Red"
    exit 1
}
Write-Color "OK ImageMagick detectado" "Green"

# ── Mapa de renombrado y categorías ──────────────────────────────────────────
# Formato: "nombre_original" = @{ nuevo = "nombre_nuevo"; cat = "categoria" }
$mapa = @{
    "20260221_150309.jpg"          = @{ nuevo = "vista_sin_clasificar.jpg";      cat = "sin_clasificar" }
    "areas verdes cabin.jpg"       = @{ nuevo = "cabana_areas_verdes.jpg";        cat = "cabana" }
    "arrollo_aguas_cristalinas.jpg"= @{ nuevo = "arroyo_aguas_cristalinas.jpg";   cat = "naturaleza" }
    "bath_1.jpg"                   = @{ nuevo = "cabana_bano_1.jpg";              cat = "cabana" }
    "bath_2.jpg"                   = @{ nuevo = "cabana_bano_2.jpg";              cat = "cabana" }
    "cabin_balcony.jpg"            = @{ nuevo = "cabana_balcon.jpg";              cat = "cabana" }
    "cabin_balcooni.jpg"           = @{ nuevo = "cabana_balcon_2.jpg";            cat = "cabana" }
    "cabin_bath.jpg"               = @{ nuevo = "cabana_bano_interior.jpg";       cat = "cabana" }
    "cabin_escalera.jpg"           = @{ nuevo = "cabana_escalera.jpg";            cat = "cabana" }
    "cabin_inside_1.jpg"           = @{ nuevo = "cabana_interior_1.jpg";          cat = "cabana" }
    "cabin_inside_2.jpg"           = @{ nuevo = "cabana_interior_2.jpg";          cat = "cabana" }
    "cabin_inside_3.jpg"           = @{ nuevo = "cabana_interior_3.jpg";          cat = "cabana" }
    "cabin_inside_4.jpg"           = @{ nuevo = "cabana_interior_4.jpg";          cat = "cabana" }
    "cabin_pasillo.jpg"            = @{ nuevo = "cabana_pasillo.jpg";             cat = "cabana" }
    "cabin_planta_baja.jpg"        = @{ nuevo = "cabana_planta_baja.jpg";         cat = "cabana" }
    "cain_room_entrace_2.jpg"      = @{ nuevo = "cabana_entrada_habitacion.jpg";  cat = "cabana" }
    "camino_a_la_arenilla_2.jpg"   = @{ nuevo = "camino_arenilla_2.jpg";          cat = "naturaleza" }
    "camino_a_la_arenilla.jpg"     = @{ nuevo = "camino_arenilla.jpg";            cat = "naturaleza" }
    "capullos_de_cafe_1.jpg"       = @{ nuevo = "cafe_capullos_1.jpg";            cat = "gastronomia" }
    "capullos_de_cafe.jpg"         = @{ nuevo = "cafe_capullos.jpg";              cat = "gastronomia" }
    "flor.jpg"                     = @{ nuevo = "flora_silvestre.jpg";            cat = "flora" }
    "fogon_artesanal.jpg"          = @{ nuevo = "fogon_artesanal.jpg";            cat = "gastronomia" }
    "Jenry.jpg"                    = @{ nuevo = "guia_jenry.jpg";                 cat = "comunidad" }
    "junta_directiva_asociacion.jpg"=@{ nuevo = "junta_directiva_asociacion.jpg"; cat = "comunidad" }
    "junta_directiva.jpg"          = @{ nuevo = "junta_directiva.jpg";            cat = "comunidad" }
    "llegando a arenilla.jpg"      = @{ nuevo = "llegando_arenilla.jpg";          cat = "naturaleza" }
    "presidente_tesorero.jpg"      = @{ nuevo = "presidente_tesorero.jpg";        cat = "comunidad" }
    "quebrada arenilla 2.jpg"      = @{ nuevo = "quebrada_arenilla_2.jpg";        cat = "naturaleza" }
    "quebrada arenilla3.jpg"       = @{ nuevo = "quebrada_arenilla_3.jpg";        cat = "naturaleza" }
    "quebrada_arenilla.jpg"        = @{ nuevo = "quebrada_arenilla.jpg";          cat = "naturaleza" }
    "senderos_naturales_2.jpg"     = @{ nuevo = "senderos_naturales_2.jpg";       cat = "naturaleza" }
    "senderos_naturales_3.jpg"     = @{ nuevo = "senderos_naturales_3.jpg";       cat = "naturaleza" }
    "senderos_naturales.jpg"       = @{ nuevo = "senderos_naturales.jpg";         cat = "naturaleza" }
}

# Crear subcarpetas por categoría
$categorias = @("cabana","naturaleza","comunidad","gastronomia","flora","sin_clasificar")
foreach ($cat in $categorias) {
    $ruta = Join-Path $carpetaDestino $cat
    if (-not (Test-Path $ruta)) {
        New-Item -ItemType Directory -Path $ruta -Force | Out-Null
    }
}
Write-Color "OK Carpetas de categoría creadas en: $carpetaDestino" "Green"
Write-Host ""

# ── Procesar ─────────────────────────────────────────────────────────────────
$procesadas   = 0
$errores      = 0
$totalOrig    = 0
$totalOptim   = 0
$i            = 0

Write-Host "Procesando $($mapa.Count) imágenes..."
Write-Host ""

foreach ($original in $mapa.Keys) {
    $i++
    $info    = $mapa[$original]
    $nuevoNombre = $info.nuevo
    $categoria   = $info.cat

    $rutaOrigen  = Join-Path $carpetaOrigen $original
    $rutaDestino = Join-Path $carpetaDestino "$categoria\$nuevoNombre"

    if (-not (Test-Path $rutaOrigen)) {
        Write-Color "[$i/$($mapa.Count)] NO ENCONTRADO: $original" "Red"
        $errores++
        continue
    }

    $tamOrig   = (Get-Item $rutaOrigen).Length
    $totalOrig += $tamOrig

    Write-Host "[$i/$($mapa.Count)] $original" -NoNewline

    $args = @(
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
        & magick @args 2>$null

        if (Test-Path $rutaDestino) {
            $tamNuevo      = (Get-Item $rutaDestino).Length
            $totalOptim   += $tamNuevo
            $reduccion     = [math]::Round((1 - $tamNuevo / $tamOrig) * 100, 1)
            $colorR        = if ($reduccion -gt 50) { "Green" } elseif ($reduccion -gt 25) { "Yellow" } else { "White" }

            Write-Host " → $nuevoNombre" -NoNewline -ForegroundColor DarkGray
            Write-Host " ($categoria)" -NoNewline -ForegroundColor DarkCyan
            Write-Host " -${reduccion}%" -ForegroundColor $colorR
            $procesadas++
        } else {
            Write-Color " ERROR al generar destino" "Red"
            $errores++
        }
    } catch {
        Write-Color " ERROR: $_" "Red"
        $errores++
    }
}

# ── Resumen ───────────────────────────────────────────────────────────────────
Write-Host ""
Write-Color "============================================" "Cyan"
Write-Color "                 RESUMEN                    " "Cyan"
Write-Color "============================================" "Cyan"
Write-Host ""
Write-Host "Procesadas : $procesadas"
Write-Host "Errores    : $errores"
Write-Host ""
Write-Host "Peso original  : $([math]::Round($totalOrig/1MB, 1)) MB"
Write-Host "Peso optimizado: $([math]::Round($totalOptim/1MB, 1)) MB"
if ($totalOrig -gt 0) {
    $red = [math]::Round((1 - $totalOptim / $totalOrig) * 100, 1)
    Write-Color "Reducción total: ${red}%" "Green"
}
Write-Host ""
Write-Color "Archivos guardados en:" "Yellow"
Write-Host $carpetaDestino
Write-Host ""
Write-Color "SIGUIENTE PASO:" "Cyan"
Write-Host "Revisar las imágenes en cada subcarpeta y confirmar"
Write-Host "que la foto 'vista_sin_clasificar.jpg' se categorice correctamente."
Write-Host ""
