$files = Get-ChildItem -Path "d:\project 2" -Filter "*.html" | Where-Object { $_.Name -like "admin-*.html" -or $_.Name -like "portal-*.html" -or $_.Name -eq "client-portal.html" }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    $content = $content -replace '(?s)\s*<button[^>]+theme-toggle-btn[^>]+>.*?</button>', ''
    $content = $content -replace '(?s)\s*<button[^>]+rtl-toggle-btn[^>]+>.*?</button>', ''

    if ($content -notmatch 'sidebar-appearance') {
        $appearanceHTML = "        <div class=`"sidebar-appearance`" style=`"margin-top:auto;`">`r`n          <div class=`"sidebar-section-label`" style=`"margin-top:0;`">Appearance</div>`r`n          <div style=`"padding: 0 1rem; display: flex; gap: 0.5rem; margin-bottom: 1rem;`">`r`n            <button class=`"btn btn-ghost rtl-toggle-btn`" style=`"flex:1;padding:0.5rem 0;font-weight:600;justify-content:center;border:1px solid var(--glass-border);`">RTL</button>`r`n            <button class=`"btn btn-ghost theme-toggle-btn`" style=`"flex:1;padding:0.5rem 0;font-weight:600;justify-content:center;border:1px solid var(--glass-border);`"><i class=`"fa-solid fa-moon`"></i> Dark</button>`r`n          </div>`r`n        </div>"
        
        $content = $content -replace '(?s)(\s*<div class="sidebar-bottom">)', "`n$appearanceHTML`$1"
    }

    if ($content -notmatch 'topbar-separator') {
        $content = $content -replace '(?s)(\s*<div class="topbar-avatar">)', "`n            <div class=`"topbar-separator`"></div>`$1"
        $content = $content -replace '(?s)(<div class="topbar-avatar">\s*<img[^>]+>\s*</div>)', "`$1`n            <i class=`"fa-solid fa-chevron-down avatar-chevron`"></i>"
    }

    Set-Content -Path $file.FullName -Value $content
}
