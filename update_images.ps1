$htmlFiles = Get-ChildItem -Path "d:\project 2" -Filter "*.html"

$replacements = @{
    "1507003211169-0a1dd7228f2d" = "1556157382-97eda2d62296" # Main Portrait -> Professional Lawyer Portrait
    "1589994965851-a8f479c573a9" = "1589829085413-56de8ae18c73" # -> Gavel
    "1521587760476-6c12a4b040da" = "1505664194779-8beaceb528b4" # -> Scales of Justice
    "1559526324-593bc073d938" = "1472851294608-062f824d29cc" # -> Courthouse
    "1577415124269-fc1140a69e91" = "1605664041951-5a461151121f" # -> Family / Hands
    "1581091226825-a6a2a5aee158" = "1521791136064-7986c2920216" # -> Business handshake
    "1604881988758-f76ad2f7aac1" = "1450101499163-c8848c66ca85" # -> Contract signing
}

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    foreach ($key in $replacements.Keys) {
        $content = $content -replace $key, $replacements[$key]
    }
    Set-Content -Path $file.FullName -Value $content
}
