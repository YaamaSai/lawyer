$htmlFiles = Get-ChildItem -Path "d:\project 2" -Filter "*.html"

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw

    # 1. Navbar Logo
    $content = $content -replace '<h2>Y\.\s*SAI\s*YASHWANTH\s*REDDY</h2>\s*<span>Attorney\s*at\s*Law</span>', '<h2 style="font-family: var(--font-heading); font-size: 1.5rem; letter-spacing: 0.05em; font-weight: 700; color: var(--ivory); margin: 0; line-height: 1.2;">ATTORNEY</h2><span style="font-family: var(--font-body); font-size: 0.65rem; color: var(--gold); letter-spacing: 0.25em; text-transform: uppercase; margin: 0;">LEGAL CONSULTANT</span>'

    # 2. Footer Logo
    $content = $content -replace '<div style="font-family:var\(--font-heading\);font-weight:700;font-size:1rem;color:var\(--ivory\);?">\s*Y\.\s*SAI\s*YASHWANTH\s*REDDY\s*</div>\s*<div style="font-size:0\.65rem;color:var\(--gold\);letter-spacing:0\.2em;text-transform:uppercase;?">\s*Attorney\s*at\s*Law\s*</div>', '<div style="font-family:var(--font-heading);font-weight:700;font-size:1.2rem;color:var(--ivory); line-height: 1;">ATTORNEY</div><div style="font-size:0.55rem;color:var(--gold);letter-spacing:0.25em;text-transform:uppercase;">LEGAL CONSULTANT</div>'

    # 3. Loader Logo (index.html only)
    $content = $content -replace '<div class="loader-logo">\s*Y\.\s*SAI\s*YASHWANTH\s*REDDY\s*</div>\s*<div style="font-size:0\.7rem;letter-spacing:0\.3em;color:var\(--gold\);text-transform:uppercase;margin-top:-0\.5rem;?">\s*Attorney\s*at\s*Law\s*</div>', '<div class="loader-logo">ATTORNEY</div><div style="font-size:0.55rem;letter-spacing:0.3em;color:var(--gold);text-transform:uppercase;margin-top:-0.5rem;">LEGAL CONSULTANT</div>'

    Set-Content -Path $file.FullName -Value $content
}
