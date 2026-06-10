$files = @("pages\index.html", "pages\index2.html", "pages\practice-areas.html")
foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        # Find the broken content="..." and prepend <meta name="description"
        $content = $content -replace '>\s*content="([^"]+)"\s*/>', '> <meta name="description" content="$1" />'
        Set-Content -Path $f -Value $content -Encoding UTF8
    }
}
