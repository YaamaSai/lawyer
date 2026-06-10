const fs = require('fs');
const path = require('path');

const replacements = {
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
};

function fixFile(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');
    let orig = content;

    for (const [bad, good] of Object.entries(replacements)) {
        content = content.split(bad).join(good);
    }

    if (content !== orig) {
        fs.writeFileSync(filePath, content, 'utf8');
        console.log(`Fixed: ${filePath}`);
    }
}

function walkDir(dir) {
    const files = fs.readdirSync(dir);
    for (const file of files) {
        const fullPath = path.join(dir, file);
        if (fs.statSync(fullPath).isDirectory()) {
            if (file !== '.git' && file !== 'node_modules') {
                walkDir(fullPath);
            }
        } else if (file.endsWith('.html')) {
            fixFile(fullPath);
        }
    }
}

walkDir('.');
console.log('Done Node fix.');
