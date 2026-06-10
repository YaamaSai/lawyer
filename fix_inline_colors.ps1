$pages = Get-ChildItem -Path "." -Filter "*.html"
foreach ($f in $pages) {
    $c = Get-Content $f.FullName -Raw
    
    # Fix the h4 tags in the footer that have inline color white
    $c = $c -replace '<h4 style="color: white;">', '<h4>'
    
    # Fix the logo in the footer that has inline color white
    $c = $c -replace '<div style="font-family:var\(--font-heading\);font-weight:700;font-size:1\.2rem;color:white; line-height: 1;">ATTORNEY</div>', '<div class="nav-logo-text"><h2 style="font-family:var(--font-heading);font-weight:700;font-size:1.2rem;line-height:1;margin:0;">ATTORNEY</h2></div>'
    
    # Fix the logo in the footer that has inline color var(--ivory)
    $c = $c -replace '<div style="font-family:var\(--font-heading\);font-weight:700;font-size:1\.2rem;color:var\(--ivory\); line-height: 1;">ATTORNEY</div>', '<div class="nav-logo-text"><h2 style="font-family:var(--font-heading);font-weight:700;font-size:1.2rem;line-height:1;margin:0;">ATTORNEY</h2></div>'

    Set-Content $f.FullName $c -NoNewline
    Write-Host "Cleaned up inline colors in $($f.Name)"
}
