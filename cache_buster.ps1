$files = Get-ChildItem -Path "d:\project 2" -Filter "*.html"
foreach ($f in $files) {
  $content = Get-Content $f.FullName -Raw
  $content = $content -replace 'href="styles.css"', 'href="styles.css?v=2"'
  $content = $content -replace 'href="styles.css\?v=\d+"', 'href="styles.css?v=3"'
  $content = $content -replace 'src="main.js"', 'src="main.js?v=2"'
  $content = $content -replace 'src="main.js\?v=\d+"', 'src="main.js?v=3"'
  Set-Content -Path $f.FullName -Value $content
}
