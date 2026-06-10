$htmlFiles = Get-ChildItem -Path "d:\project 2" -Filter "*.html"

$newFavicon = '<link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 640 640%22><text y=%22520%22 font-size=%22520%22>⚖️</text></svg>">'

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace any existing <link rel="icon" ...> tag
    $content = $content -replace '(?s)<link rel="icon"[^>]+>', $newFavicon
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "Updated favicons globally to match the exact snippet provided."
