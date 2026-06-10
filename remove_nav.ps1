$htmlFiles = Get-ChildItem -Path "pages" -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Update Home links with chevron icon
    $content = $content -replace '<a\s+href="index\.html"\s+class="nav-link(\s+active)?">Home\s*<i', '<a href="#" class="nav-link$1">Home <i'
    
    # Update Dashboard links with chevron icon
    $content = $content -replace '<a\s+href="client-portal\.html"\s+class="nav-link(\s+active)?">Dashboard\s*<i', '<a href="#" class="nav-link$1">Dashboard <i'
    
    # Note: For index2.html, the Home link might have newlines inside the tag, so let's handle that if needed. 
    # The regex \s* handles spaces but if there's a newline between "Home " and "<i", we can use (?s) or \s+.
    $content = [regex]::Replace($content, '<a\s+href="index\.html"\s+class="nav-link(\s+active)?">Home\s*<i', '<a href="#" class="nav-link$1">Home <i')
    $content = [regex]::Replace($content, '<a\s+href="client-portal\.html"\s+class="nav-link(\s+active)?">Dashboard\s*<i', '<a href="#" class="nav-link$1">Dashboard <i')

    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
}
Write-Output "Links updated."
