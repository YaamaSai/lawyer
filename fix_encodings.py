import os

replacements = {
    'â€”': '-',
    'â€“': '-',
    'â€™': "'",
    'Â©': '©',
    'Ã¢â‚¬â€œ': '-',
    'A,??': '-',
    'A,?o': '-',
    'A,Ac': '©',
    'â€œ': '"',
    'â€': '"',
    'Ã¢â‚¬â„¢': "'"
}

def fix_file(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except UnicodeDecodeError:
        try:
            with open(filepath, 'r', encoding='windows-1252') as f:
                content = f.read()
        except:
            return

    orig = content
    for bad, good in replacements.items():
        content = content.replace(bad, good)
        
    if content != orig:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Fixed: {filepath}")

for root, dirs, files in os.walk('.'):
    for file in files:
        if file.endswith('.html'):
            fix_file(os.path.join(root, file))
print("Done Python fix.")
