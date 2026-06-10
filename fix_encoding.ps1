$path = "d:\project 2\portal-payments.html"
$c = Get-Content $path -Raw

# Fix encodings
$c = $c -replace 'â‚¹', '&#8377;'
$c = $c -replace 'â€”', '&mdash;'
$c = $c -replace 'â€"', '&mdash;'
$c = $c -replace 'â€¢', '&bull;'

Set-Content $path $c -Encoding UTF8
Write-Host "Encoding fixed."
