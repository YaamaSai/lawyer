$pages = @("client-portal.html", "portal-documents.html", "portal-messages.html", "portal-payments.html", "portal-appointments.html", "portal-settings.html")

foreach ($page in $pages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $c = Get-Content $path -Raw
        
        # Extract the Account Settings line
        if ($c -match '(\s*<a href="portal-settings\.html" class="sidebar-link[^"]*"><i class="fa-solid fa-gear"></i> Account Settings</a>)') {
            $settingsLink = $matches[1]
            
            # Remove it from its current position
            $c = $c -replace '(\s*<a href="portal-settings\.html" class="sidebar-link[^"]*"><i class="fa-solid fa-gear"></i> Account Settings</a>)', ''
            
            # Insert it right before </nav>, maybe add a label too
            $newSettings = "`n        <div class=`"sidebar-section-label`">Account</div>$settingsLink`n      </nav>"
            
            $c = $c -replace '\s*</nav>', $newSettings
            
            Set-Content $path $c -Encoding UTF8
            Write-Host "Updated $page"
        }
    }
}
