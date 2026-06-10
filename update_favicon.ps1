$htmlFiles = Get-ChildItem -Path "d:\project 2" -Filter "*.html"

$faviconTag = "<link rel=`"icon`" href=`"data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>⚖️</text></svg>`" />"

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace title
    $content = $content -replace '(?i)<title>.*?</title>', '<title>ATTORNEY</title>'
    
    # Add favicon if it doesn't exist
    if ($content -notmatch '(?i)<link[^>]*rel=["'']icon["''][^>]*>') {
        $content = $content -replace '(?i)(<title>ATTORNEY</title>)', "`$1`n  $faviconTag"
    }
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Host "Updated titles and favicons for all HTML files."
