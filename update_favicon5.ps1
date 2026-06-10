$htmlFiles = Get-ChildItem -Path "d:\project 2" -Filter "*.html"

$newFavicon = '<link rel="icon" type="image/svg+xml" href="assets/favicon.svg?v=2" />'

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace the data URI favicon with the external file link
    $content = $content -replace '(?s)<link rel="icon" href="data:image/svg\+xml,.*?/>', $newFavicon
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "Updated favicons to use the external SVG file with a cache-buster."
