# Corregir bug en main.js ($ -> $$)
$jsPath = "D:\ARENILLA\docs\js\main.js"
$content = Get-Content $jsPath -Raw

# Reemplazar los selectores incorrectos
$content = $content -replace "const filtros = \`\$\('\.galeria__filtro, \.galeria-filtro'\);", "const filtros = `$`$('.galeria__filtro, .galeria-filtro');"
$content = $content -replace "const items = \`\$\('\.galeria__item'\);", "const items = `$`$('.galeria__item');"

Set-Content $jsPath -Value $content -NoNewline
Write-Host "main.js corregido!" -ForegroundColor Green
