$themeBtn = '<button class="btn btn-ghost theme-toggle-btn" style="padding:0.5rem 0.8rem;font-weight:600;"><i class="fa-solid fa-sun"></i> Light</button>'

$publicPages = @("index.html","about.html","practice-areas.html","blog.html","contact.html")
$portalPages = @("client-portal.html","portal-messages.html","portal-documents.html","portal-payments.html","portal-appointments.html","portal-settings.html","login.html")

foreach ($page in $publicPages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        # Remove existing theme button if any (idempotent)
        $content = $content -replace '<button class="btn btn-ghost theme-toggle-btn"[^>]*>.*?</button>\s*', ''
        # Insert before .nav-actions opening tag's first child (the RTL or Login button)
        $content = $content -replace '(<div class="nav-actions">[\r\n\s]*)', "`$1        $themeBtn`r`n        "
        Set-Content -Path $path -Value $content -NoNewline
        Write-Host "Updated $page"
    }
}

foreach ($page in $portalPages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        # Remove existing theme button if any
        $content = $content -replace '<button class="btn btn-ghost theme-toggle-btn"[^>]*>.*?</button>\s*', ''
        # Insert inside portal-topbar-right before the avatar
        $content = $content -replace '(<div class="portal-topbar-right">[\r\n\s]*)', "`$1          $themeBtn`r`n          "
        Set-Content -Path $path -Value $content -NoNewline
        Write-Host "Updated $page"
    }
}
