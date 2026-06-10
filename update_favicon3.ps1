$htmlFiles = Get-ChildItem -Path "d:\project 2" -Filter "*.html"

$newFavicon = '<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 0 512 512''%3E%3Cdefs%3E%3ClinearGradient id=''g'' x1=''0%25'' y1=''0%25'' x2=''100%25'' y2=''100%25''%3E%3Cstop offset=''0%25'' stop-color=''%239A7A45''/%3E%3Cstop offset=''100%25'' stop-color=''%23C8A96B''/%3E%3C/linearGradient%3E%3C/defs%3E%3Crect width=''512'' height=''512'' rx=''116'' fill=''url(%23g)''/%3E%3Cg transform=''translate(106, 106) scale(0.585)''%3E%3Cpath fill=''%23ffffff'' d=''M256 0c-17.7 0-32 14.3-32 32V66.1C97.1 82.8 0 192.2 0 320c0 106 86 192 192 192c53.3 0 101.6-21.7 136.4-56.8C363.2 490.3 411.5 512 464.8 512c26.5 0 48-21.5 48-48s-21.5-48-48-48c-36.4 0-69.5 13.9-94.4 36.6c-4.9-5-10.1-9.9-15.6-14.5c41.3-43 65.2-101.8 65.2-166.1c0-127.8-97.1-237.2-224-253.9V32c0-17.7-14.3-32-32-32zm0 128A192 192 0 1 1 256 512 192 192 0 1 1 256 128zm0 64a128 128 0 1 0 0 256 128 128 0 1 0 0-256z''/%3E%3C/g%3E%3C/svg%3E" />'

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace the previous favicon with the exact match one
    $content = $content -replace '(?s)<link rel="icon" href="data:image/svg\+xml,.*?/>', $newFavicon
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "Updated favicons to the EXACT gradient matching logo for all HTML files."
