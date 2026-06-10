const fs = require('fs');
const path = require('path');

const inlineScript = `
  <script>
    (function() {
      try {
        var savedTheme = localStorage.getItem('theme') || 'dark';
        document.documentElement.setAttribute('data-theme', savedTheme);
      } catch (e) {}
    })();
  </script>
`;

function fixFile(filePath) {
    let content = fs.readFileSync(filePath, 'utf8');
    
    // Check if we already injected it
    if (content.includes("localStorage.getItem('theme') || 'dark'")) {
        return;
    }

    // Find <head> and insert right after it
    if (content.includes('<head>')) {
        content = content.replace('<head>', '<head>' + inlineScript);
        fs.writeFileSync(filePath, content, 'utf8');
        console.log(`Injected theme script into: ${filePath}`);
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
console.log('Done injecting theme script.');
