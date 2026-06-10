$pages = Get-ChildItem -Path "." -Filter "*.html"
foreach ($f in $pages) {
    $c = Get-Content $f.FullName -Raw
    $c = $c -replace '<button class="btn btn-ghost rtl-toggle-btn"([^>]*)><i class="fa-solid fa-language"></i> RTL</button>', '<button class="btn btn-ghost rtl-toggle-btn"$1>RTL</button>'
    Set-Content $f.FullName $c -NoNewline
    Write-Host "Updated $($f.Name)"
}
