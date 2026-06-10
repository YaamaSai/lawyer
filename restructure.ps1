$root = "d:\project 2"

# 1. Create directories
New-Item -ItemType Directory -Force -Path "$root\assets\css" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\assets\js" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\assets\js\plugins" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\assets\images" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\assets\fonts" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\pages" | Out-Null
New-Item -ItemType Directory -Force -Path "$root\documentation" | Out-Null

# 2. Create empty README
if (-not (Test-Path "$root\README.md")) {
    New-Item -ItemType File -Path "$root\README.md" | Out-Null
}

# 3. Move styles and JS
if (Test-Path "$root\styles.css") { Move-Item "$root\styles.css" "$root\assets\css\style.css" -Force }
if (Test-Path "$root\main.js") { Move-Item "$root\main.js" "$root\assets\js\main.js" -Force }

# 4. Move existing assets (images/svgs) into assets/images
if (Test-Path "$root\assets") {
    $images = Get-ChildItem -Path "$root\assets" -File
    foreach ($img in $images) {
        Move-Item $img.FullName "$root\assets\images\$($img.Name)" -Force
    }
}

# 5. Move all HTML files
$htmls = Get-ChildItem -Path $root -Filter "*.html" -File
foreach ($h in $htmls) {
    Move-Item $h.FullName "$root\pages\$($h.Name)" -Force
}

# 6. Update paths inside HTML files
$pages = Get-ChildItem -Path "$root\pages" -Filter "*.html"
foreach ($p in $pages) {
    $content = Get-Content $p.FullName -Raw
    
    # Update CSS link
    $content = $content -replace 'href="styles\.css(\?v=\d+)?"', 'href="../assets/css/style.css"'
    
    # Update JS script
    $content = $content -replace 'src="main\.js(\?v=\d+)?"', 'src="../assets/js/main.js"'
    
    # Update existing assets folder references to new assets/images folder
    $content = $content -replace 'src="assets/', 'src="../assets/images/'
    $content = $content -replace "url\('assets/", "url('../assets/images/"
    $content = $content -replace 'url\("assets/', 'url("../assets/images/'
    
    Set-Content -Path $p.FullName -Value $content -Encoding UTF8
}

Write-Output "Restructuring complete."
