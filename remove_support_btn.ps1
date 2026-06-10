$pages = @("client-portal.html", "portal-documents.html", "portal-messages.html", "portal-payments.html", "portal-appointments.html", "portal-settings.html")

foreach ($page in $pages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw
        
        # Match the Get Support link over multiple lines
        $c = $c -replace '(?s)\s*<a href="contact\.html" class="sidebar-link" style="color:var\(--gold\);">\s*<i class="fa-solid fa-headset"></i> Get Support\s*</a>', ''
        
        Set-Content $path $c -Encoding UTF8
        Write-Host "Updated $page"
    }
}
