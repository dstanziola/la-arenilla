# ============================================================================
# Copiar y renombrar imagenes para compatibilidad web
# ============================================================================

$origen = "D:\ARENILLA\assets\images\optimizadas_v2\webp"
$destino = "D:\ARENILLA\docs\assets\img\galeria"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "   COPIAR IMAGENES A GALERIA               " -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Mapeo de nombres originales a nombres seguros (sin acentos ni caracteres especiales)
$renombrar = @{
    "fogon_de_leña.webp" = "fogon.webp"
    "niños_conjunto_tipico.webp" = "comunidad-tipico.webp"
    "niños_conjunto_tipico_2.webp" = "comunidad-tipico-2.webp"
    "niños_vivero.webp" = "vivero-comunidad.webp"
}

$imagenes = Get-ChildItem -Path $origen -Filter "*.webp"
$copiadas = 0

foreach ($img in $imagenes) {
    # Determinar nombre destino
    if ($renombrar.ContainsKey($img.Name)) {
        $nombreDestino = $renombrar[$img.Name]
    } else {
        $nombreDestino = $img.Name
    }
    
    $rutaDestino = Join-Path $destino $nombreDestino
    Copy-Item $img.FullName $rutaDestino -Force
    
    if ($img.Name -ne $nombreDestino) {
        Write-Host "  OK $($img.Name) -> $nombreDestino" -ForegroundColor Yellow
    } else {
        Write-Host "  OK $nombreDestino" -ForegroundColor Green
    }
    $copiadas++
}

Write-Host ""
Write-Host "Copiadas: $copiadas imagenes" -ForegroundColor Cyan
Write-Host "Destino: $destino" -ForegroundColor Yellow
Write-Host ""
Write-Host "SIGUIENTE PASO:" -ForegroundColor Cyan
Write-Host "1. Revisa las imagenes en: $destino"
Write-Host "2. Ejecuta: git add . && git commit -m 'Agregar pagina galeria con imagenes' && git push"
Write-Host ""
