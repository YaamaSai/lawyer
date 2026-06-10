$portalPages = @("portal-documents.html", "portal-appointments.html", "portal-payments.html", "portal-messages.html")

$oldLogo = '<div style="font-family:var(--font-heading);font-weight:700;font-size:0.85rem;color:var(--ivory);">ATTORNEY</div>
          <div style="font-size:0.6rem;color:var(--gold);letter-spacing:0.15em;text-transform:uppercase;">Client Portal</div>'

$newLogo = '<div style="font-family:var(--font-heading);font-weight:700;font-size:1rem;color:var(--ivory);letter-spacing:0.05em;line-height:1.1;">ATTORNEY</div>
          <div style="font-size:0.55rem;color:var(--gold);letter-spacing:0.22em;text-transform:uppercase;">Legal Consultant</div>'

foreach ($page in $portalPages) {
    $path = "d:\project 2\$page"
    if (Test-Path $path) {
        $content = Get-Content $path -Raw
        $content = $content -replace [regex]::Escape('<div style="font-family:var(--font-heading);font-weight:700;font-size:0.85rem;color:var(--ivory);">ATTORNEY</div>
          <div style="font-size:0.6rem;color:var(--gold);letter-spacing:0.15em;text-transform:uppercase;">Client Portal</div>'), '<div style="font-family:var(--font-heading);font-weight:700;font-size:1rem;color:var(--ivory);letter-spacing:0.05em;line-height:1.1;">ATTORNEY</div>
          <div style="font-size:0.55rem;color:var(--gold);letter-spacing:0.22em;text-transform:uppercase;">Legal Consultant</div>'
        Set-Content $path $content
    }
}
Write-Host "Done"
