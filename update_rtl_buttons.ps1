$publicPages = @("index.html", "about.html", "practice-areas.html", "blog.html", "contact.html")
$portalPages = @("client-portal.html", "portal-messages.html", "portal-documents.html", "portal-payments.html", "portal-appointments.html", "portal-settings.html")

$publicBtn = '<button class="btn btn-ghost rtl-toggle-btn" style="padding: 0.5rem 0.8rem; font-weight: 600;"><i class="fa-solid fa-language"></i> RTL</button>'
$portalBtn = '<button class="btn btn-ghost rtl-toggle-btn" style="padding: 0.5rem 0.8rem; font-weight: 600;"><i class="fa-solid fa-language"></i> RTL</button>'

foreach ($page in $publicPages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        # Remove old button if exists (so script is idempotent)
        $content = $content -replace '<button class="btn btn-ghost rtl-toggle-btn".*?</button>\s*', ''
        
        # Inject new button
        $content = $content -replace '(<a href="login.html" class="btn btn-gold">)', "$publicBtn`r`n          `$1"
        Set-Content -Path $path -Value $content -NoNewline
    }
}

foreach ($page in $portalPages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        # Remove old button if exists
        $content = $content -replace '<button class="btn btn-ghost rtl-toggle-btn".*?</button>\s*', ''
        
        # Inject new button
        $content = $content -replace '(<div class="topbar-avatar">)', "$portalBtn`r`n          `$1"
        Set-Content -Path $path -Value $content -NoNewline
    }
}
