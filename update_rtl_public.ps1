$publicPages = @("index.html", "about.html", "practice-areas.html", "blog.html", "contact.html")
$publicBtn = '<button class="btn btn-ghost rtl-toggle-btn" style="padding: 0.5rem 0.8rem; font-weight: 600;"><i class="fa-solid fa-language"></i> RTL</button>'

foreach ($page in $publicPages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        
        # In case it's there but hidden, remove it first
        $content = $content -replace '<button class="btn btn-ghost rtl-toggle-btn".*?</button>\s*', ''
        
        # Inject new button inside .nav-actions
        $content = $content -replace '(<div class="nav-actions">)', "`$1`r`n        $publicBtn"
        Set-Content -Path $path -Value $content -NoNewline
    }
}
