# Attorney Template Documentation

Welcome to the documentation for the Attorney & Legal Consultant Web Template. This guide outlines how to manage, customize, and extend the template.

## 1. CSS Architecture (`assets/css/style.css`)
The styling is completely driven by native CSS variables (Custom Properties) defined at the `:root` level. 

### Changing Colors
To rebrand the website, simply update the core variables at the top of `style.css`:
```css
:root {
  --navy: #0A1628;        /* Main dark background */
  --gold: #C8A96B;        /* Primary accent color */
  --gold-dark: #9A7230;   /* Hover states for gold */
  --ivory: #FAF8F4;       /* Primary text color */
}
```

### Theme System
The template includes three main themes. Themes are activated by setting the `data-theme` attribute on the `<body>` tag.
- **Dark (Default)**: No attribute needed. Uses the `--navy` and `--gold` aesthetic.
- **Light (`data-theme="light"`)**: A warm ivory/beige background with dark text.
- **Light Alternative (`data-theme="light-2"`)**: A crisp white/blue-tinted background.

## 2. JavaScript Logic (`assets/js/main.js`)

### Scroll Animations
Elements with the class `.fade-in`, `.slide-up`, or `.slide-in-right` will automatically animate when they scroll into the viewport. This is handled by a lightweight `IntersectionObserver` in `main.js`.

### Number Counters
To create an animated number counter (like the stats on the homepage), add the `data-count` attribute to an element:
```html
<h3 data-count="500">0</h3>
```
The script will automatically count from 0 to 500 when the element becomes visible.

### Floating Particles
The gold dots floating in the background of the hero section are dynamically generated via JavaScript to bypass a known iOS Safari bug regarding CSS variables inside keyframes. You can configure their density, speed, and positioning directly in the `particleConfigs` array within `main.js`.

## 3. RTL (Right-to-Left) Support
RTL mode is fully supported for languages like Arabic or Hebrew. 
- The toggle button adds the `.rtl-active` (or `.portal-rtl-active`) class to the `<body>`.
- It dynamically changes `document.documentElement.dir = 'rtl'`.
- All CSS flexbox alignments, sidebars, and mobile menus are specifically overridden in `style.css` to mirror properly.

## 4. Portals and Dashboards
The template includes static HTML views for backend application states:
- **Client Portal**: Found in `client-portal.html`, `portal-documents.html`, etc.
- **Admin Portal**: Found in `admin-portal.html`, `admin-appointments.html`, etc.
These files share the same global CSS and JS but utilize a sidebar/main-content layout rather than a traditional top-navigation layout.
