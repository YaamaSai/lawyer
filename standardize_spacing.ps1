$htmlFiles = Get-ChildItem -Path "pages" -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Remove inline padding styles from section tags
    # This specifically targets patterns like padding: 6rem 0; padding: 5rem 0; padding: 3rem 0; padding:3rem 0;
    $content = [regex]::Replace($content, '(?i)(<section[^>]*style="[^"]*)padding:\s*\d+rem\s*0;?\s*', '$1')
    
    # Also handle if it's the last attribute and has no trailing semicolon
    $content = [regex]::Replace($content, '(?i)(<section[^>]*style="[^"]*)padding:\s*\d+rem\s*0\s*(?=")', '$1')
    
    # Clean up empty style attributes left behind
    $content = $content -replace '\s*style="\s*"', ''
    
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}

Write-Output "Inline paddings removed from sections."
