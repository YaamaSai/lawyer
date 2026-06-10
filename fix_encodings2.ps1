$files = Get-ChildItem -Path . -Filter *.html -Recurse

$replacements = @{
    "â€”" = "-"
    "â€“" = "-"
    "â€™" = "'"
    "Â©"  = "©"
    "Ã¢â‚¬â€œ" = "-"
    "A,??" = "-"
    "A,?o" = "-"
    "A,Ac" = "©"
    "â€œ" = '"'
    "â€"  = '"'
    "Ã¢â‚¬â„¢" = "'"
}

foreach ($f in $files) {
    try {
        $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    } catch {
        continue
    }

    $orig = $content
    foreach ($key in $replacements.Keys) {
        $content = $content.Replace($key, $replacements[$key])
    }

    if ($content -cne $orig) {
        [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Output "Fixed: $($f.Name)"
    }
}
Write-Output "Done PowerShell fix."
