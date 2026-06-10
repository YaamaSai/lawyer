// ============================================
// Y SAI YASHWANTH REDDY - ATTORNEY AT LAW
// Main JavaScript
// ============================================

document.addEventListener('DOMContentLoaded', () => {

  // ---- PAGE LOADER ----
  const loader = document.getElementById('page-loader');
  if (loader) {
    setTimeout(() => {
      loader.classList.add('hidden');
    }, 1400);
  }

  // ---- CURSOR GLOW ----
  const cursor = document.getElementById('cursor-glow');
  if (cursor) {
    document.addEventListener('mousemove', (e) => {
      cursor.style.left = e.clientX + 'px';
      cursor.style.top = e.clientY + 'px';
      cursor.style.opacity = '1';
    });
    document.addEventListener('mouseleave', () => {
      cursor.style.opacity = '0';
    });
  }

  // ---- NAVBAR SCROLL ----
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    const handleScroll = () => {
      if (window.scrollY > 40) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    };
    window.addEventListener('scroll', handleScroll, { passive: true });
    handleScroll();
  }

  // ---- MOBILE MENU ----
  const mobileToggle = document.getElementById('mobile-toggle');
  const mobileMenu = document.getElementById('mobile-menu');
  if (mobileToggle && mobileMenu) {
    mobileToggle.addEventListener('click', () => {
      mobileMenu.classList.toggle('open');
    });
  }

  // ---- SCROLL ANIMATIONS ----
  const animatedEls = document.querySelectorAll('.fade-in, .fade-in-left, .fade-in-right');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      }
    });
  }, { threshold: 0.1, rootMargin: '0px 0px -40px 0px' });

  animatedEls.forEach(el => observer.observe(el));

  // ---- HERO PARTICLES ----
  const particleContainer = document.getElementById('hero-particles');
  if (particleContainer) {
    const particleConfigs = [
      { top: '15%', left: '8%', tx: '20px', ty: '-40px', duration: '9s', delay: '0s' },
      { top: '25%', left: '85%', tx: '-15px', ty: '-30px', duration: '7s', delay: '1s' },
      { top: '60%', left: '12%', tx: '30px', ty: '-20px', duration: '11s', delay: '2s' },
      { top: '70%', left: '78%', tx: '-25px', ty: '-35px', duration: '8s', delay: '0.5s' },
      { top: '40%', left: '50%', tx: '10px', ty: '-50px', duration: '13s', delay: '3s' },
      { top: '85%', left: '30%', tx: '20px', ty: '-25px', duration: '10s', delay: '1.5s' },
      { top: '10%', left: '65%', tx: '-10px', ty: '-40px', duration: '6s', delay: '2.5s' },
      { top: '50%', left: '92%', tx: '-20px', ty: '-30px', duration: '12s', delay: '0.8s' },
      // Added particles for extra density
      { top: '35%', left: '20%', tx: '15px', ty: '-35px', duration: '10s', delay: '0.2s' },
      { top: '80%', left: '15%', tx: '-10px', ty: '-45px', duration: '8.5s', delay: '1.2s' },
      { top: '18%', left: '45%', tx: '-25px', ty: '-20px', duration: '11.5s', delay: '2.8s' },
      { top: '90%', left: '60%', tx: '22px', ty: '-28px', duration: '7.5s', delay: '0.4s' },
      { top: '55%', left: '70%', tx: '-18px', ty: '-50px', duration: '9.5s', delay: '3.1s' },
      { top: '45%', left: '5%', tx: '25px', ty: '-30px', duration: '14s', delay: '1.8s' },
      { top: '22%', left: '95%', tx: '-12px', ty: '-22px', duration: '6.5s', delay: '2.2s' },
      { top: '75%', left: '40%', tx: '18px', ty: '-42px', duration: '10.5s', delay: '0.7s' },
      { top: '5%', left: '25%', tx: '-20px', ty: '-35px', duration: '12.5s', delay: '1.4s' },
      { top: '65%', left: '90%', tx: '10px', ty: '-48px', duration: '8s', delay: '2.9s' },
      // Even more particles to reach 30
      { top: '28%', left: '35%', tx: '-15px', ty: '-25px', duration: '9.2s', delay: '0.5s' },
      { top: '82%', left: '75%', tx: '18px', ty: '-38px', duration: '11.8s', delay: '1.6s' },
      { top: '42%', left: '80%', tx: '-22px', ty: '-32px', duration: '8.2s', delay: '2.1s' },
      { top: '12%', left: '55%', tx: '28px', ty: '-45px', duration: '13.5s', delay: '0.9s' },
      { top: '58%', left: '28%', tx: '-12px', ty: '-28px', duration: '7.8s', delay: '3.5s' },
      { top: '95%', left: '45%', tx: '15px', ty: '-55px', duration: '10.2s', delay: '1.1s' },
      { top: '32%', left: '62%', tx: '-18px', ty: '-42px', duration: '12.8s', delay: '2.4s' },
      { top: '48%', left: '38%', tx: '25px', ty: '-25px', duration: '9.8s', delay: '0.3s' },
      { top: '68%', left: '8%', tx: '-20px', ty: '-40px', duration: '14.5s', delay: '1.9s' },
      { top: '8%', left: '82%', tx: '12px', ty: '-30px', duration: '8.8s', delay: '3.2s' },
      { top: '88%', left: '22%', tx: '-25px', ty: '-35px', duration: '11.2s', delay: '0.8s' },
      { top: '72%', left: '55%', tx: '20px', ty: '-50px', duration: '10.8s', delay: '2.7s' }
    ];
    const styleEl = document.createElement('style');
    let keyframesCSS = '';

    particleConfigs.forEach((cfg, i) => {
      const p = document.createElement('div');
      p.className = 'particle';
      
      const txNum = parseFloat(cfg.tx);
      const tyNum = parseFloat(cfg.ty);
      const txUnit = cfg.tx.replace(/[0-9.-]/g, '');
      const tyUnit = cfg.ty.replace(/[0-9.-]/g, '');
      const invTx = (-txNum) + txUnit;
      const invTy = (-tyNum) + tyUnit;
      const animName = `float-mobile-safe-${i}`;

      p.style.cssText = `top:${cfg.top};left:${cfg.left};-webkit-animation:${animName} ${cfg.duration} ${cfg.delay} infinite ease-in-out alternate;animation:${animName} ${cfg.duration} ${cfg.delay} infinite ease-in-out alternate;`;
      particleContainer.appendChild(p);

      keyframesCSS += `
        @-webkit-keyframes ${animName} {
          0% { -webkit-transform: translate(0, 0) scale(1); transform: translate(0, 0) scale(1); opacity: 0.2; }
          50% { opacity: 0.6; -webkit-transform: translate(${cfg.tx}, ${cfg.ty}) scale(1.2); transform: translate(${cfg.tx}, ${cfg.ty}) scale(1.2); }
          100% { -webkit-transform: translate(${invTx}, ${invTy}) scale(0.8); transform: translate(${invTx}, ${invTy}) scale(0.8); opacity: 0.2; }
        }
        @keyframes ${animName} {
          0% { transform: translate(0, 0) scale(1); opacity: 0.2; }
          50% { opacity: 0.6; transform: translate(${cfg.tx}, ${cfg.ty}) scale(1.2); }
          100% { transform: translate(${invTx}, ${invTy}) scale(0.8); opacity: 0.2; }
        }
      `;
    });
    styleEl.innerHTML = keyframesCSS;
    document.head.appendChild(styleEl);
  }

  // ---- COUNT-UP ANIMATION ----
  const countEls = document.querySelectorAll('[data-count]');
  const countObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target;
        const target = el.getAttribute('data-count');
        const isFloat = target.includes('.');
        const numericTarget = parseFloat(target.replace(/[^0-9.]/g, ''));
        const prefix = target.match(/^[^0-9]*/)?.[0] || '';
        const suffix = target.match(/[^0-9.]+$/)?.[0] || '';
        const duration = 1800;
        const start = performance.now();

        const animate = (now) => {
          const elapsed = now - start;
          const progress = Math.min(elapsed / duration, 1);
          const eased = 1 - Math.pow(1 - progress, 3);
          const current = numericTarget * eased;
          el.textContent = prefix + (isFloat ? current.toFixed(1) : Math.floor(current)) + suffix;
          if (progress < 1) requestAnimationFrame(animate);
          else el.textContent = prefix + target.replace(/^[^0-9]*/, '').replace(/[^0-9.]+$/, '') + suffix;
        };

        requestAnimationFrame(animate);
        countObserver.unobserve(el);
      }
    });
  }, { threshold: 0.5 });

  countEls.forEach(el => countObserver.observe(el));

  // ---- TILT EFFECT on cards ----
  const tiltCards = document.querySelectorAll('.tilt-card');
  tiltCards.forEach(card => {
    card.addEventListener('mousemove', (e) => {
      const rect = card.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      const centerX = rect.width / 2;
      const centerY = rect.height / 2;
      const rotX = ((y - centerY) / centerY) * -8;
      const rotY = ((x - centerX) / centerX) * 8;
      card.style.transform = `perspective(1000px) rotateX(${rotX}deg) rotateY(${rotY}deg) translateY(-4px)`;
    });
    card.addEventListener('mouseleave', () => {
      card.style.transform = '';
    });
  });

  // ---- CONTACT FORM ----
  const contactForm = document.getElementById('contact-form');
  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();
      const btn = contactForm.querySelector('[type="submit"]');
      const orig = btn.innerHTML;
      btn.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin"></i> Sending...';
      btn.disabled = true;
      setTimeout(() => {
        btn.innerHTML = '<i class="fa-solid fa-circle-check"></i> Message Sent!';
        btn.style.background = 'var(--green)';
        setTimeout(() => {
          btn.innerHTML = orig;
          btn.disabled = false;
          btn.style.background = '';
          contactForm.reset();
        }, 3000);
      }, 1800);
    });
  }

  // ---- PORTAL: Upload zone ----
  const uploadZone = document.getElementById('upload-zone');
  if (uploadZone) {
    uploadZone.addEventListener('click', () => {
      const input = document.createElement('input');
      input.type = 'file';
      input.multiple = true;
      input.accept = '.pdf,.doc,.docx,.jpg,.png';
      input.onchange = (e) => {
        const files = Array.from(e.target.files);
        showToast(`${files.length} file(s) uploaded securely`, 'success');
      };
      input.click();
    });

    ['dragover', 'dragenter'].forEach(evt => {
      uploadZone.addEventListener(evt, (e) => {
        e.preventDefault();
        uploadZone.style.borderColor = 'var(--gold)';
        uploadZone.style.background = 'rgba(200,169,107,0.08)';
      });
    });

    ['dragleave', 'drop'].forEach(evt => {
      uploadZone.addEventListener(evt, (e) => {
        e.preventDefault();
        uploadZone.style.borderColor = '';
        uploadZone.style.background = '';
        if (evt === 'drop') {
          const files = Array.from(e.dataTransfer.files);
          if (files.length) showToast(`${files.length} file(s) uploaded securely`, 'success');
        }
      });
    });
  }

  // ---- PORTAL: Payment button ----
  const payBtn = document.getElementById('pay-btn');
  if (payBtn) {
    payBtn.addEventListener('click', () => {
      showToast('Redirecting to secure payment gateway...', 'info');
    });
  }

  // ---- PORTAL: Schedule button ----
  const schedBtn = document.getElementById('schedule-btn');
  if (schedBtn) {
    schedBtn.addEventListener('click', () => {
      showToast('Opening scheduling calendar...', 'info');
    });
  }

  // ---- TOAST NOTIFICATION ----
  function showToast(message, type = 'info') {
    const existing = document.querySelector('.toast-notification');
    if (existing) existing.remove();

    const colors = {
      success: 'var(--green)',
      info: 'var(--gold)',
      error: 'var(--red-badge)'
    };

    const icons = {
      success: 'fa-circle-check',
      info: 'fa-circle-info',
      error: 'fa-circle-xmark'
    };

    const toast = document.createElement('div');
    toast.className = 'toast-notification';
    toast.innerHTML = `<i class="fa-solid ${icons[type]}"></i> ${message}`;
    toast.style.cssText = `
      position: fixed; bottom: 2rem; right: 2rem; z-index: 99999;
      background: var(--navy-mid); border: 1px solid ${colors[type]};
      color: var(--ivory); padding: 1rem 1.5rem; border-radius: 12px;
      font-size: 0.875rem; font-weight: 500; display: flex; align-items: center;
      gap: 0.75rem; box-shadow: 0 8px 30px rgba(0,0,0,0.4);
      transform: translateY(20px); opacity: 0;
      transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    `;
    toast.querySelector('i').style.color = colors[type];
    document.body.appendChild(toast);

    requestAnimationFrame(() => {
      toast.style.transform = 'translateY(0)';
      toast.style.opacity = '1';
    });

    setTimeout(() => {
      toast.style.transform = 'translateY(20px)';
      toast.style.opacity = '0';
      setTimeout(() => toast.remove(), 400);
    }, 4000);
  }

  // ---- ACTIVE NAV LINK ----
  const currentPage = window.location.pathname.split('/').pop() || 'index.html';
  document.querySelectorAll('.nav-link').forEach(link => {
    const href = link.getAttribute('href');
    if (href === currentPage || (currentPage === '' && href === 'index.html')) {
      link.classList.add('active');
    }
  });

  document.querySelectorAll('.mobile-menu > a:not(.mobile-menu-logo):not(.btn), .mobile-menu a.sub-link').forEach(link => {
    const href = link.getAttribute('href');
    if (href === currentPage || (currentPage === '' && href === 'index.html')) {
      link.classList.add('active');
      
      // If it's a sub-link inside a dropdown, also highlight and auto-open the dropdown
      if (link.classList.contains('sub-link')) {
        const dropdown = link.closest('.mobile-dropdown');
        if (dropdown) {
          const btn = dropdown.querySelector('.mobile-dropdown-btn');
          const content = dropdown.querySelector('.mobile-dropdown-content');
          if (btn && content) {
            btn.classList.add('active');
            content.classList.add('open');
            btn.setAttribute('aria-expanded', 'true');
            const icon = btn.querySelector('i');
            if (icon) icon.style.transform = 'rotate(180deg)';
          }
        }
      }
    }
  });

  // ---- THEME TOGGLE (Dark / Light) ----
  const themeBtns = document.querySelectorAll('.theme-toggle-btn');

  const applyTheme = (theme) => {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
    themeBtns.forEach(btn => {
      if (btn.classList.contains('icon-only')) {
        btn.innerHTML = theme === 'light'
          ? '<i class="fa-solid fa-moon"></i>'
          : '<i class="fa-solid fa-sun"></i>';
      } else {
        btn.innerHTML = theme === 'light'
          ? '<i class="fa-solid fa-moon"></i> Dark'
          : '<i class="fa-solid fa-sun"></i> Light';
      }
    });
  };

  // Apply saved theme on load
  const savedTheme = localStorage.getItem('theme') || 'dark';
  applyTheme(savedTheme);

  themeBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const current = document.documentElement.getAttribute('data-theme');
      applyTheme(current === 'light' ? 'dark' : 'light');
    });
  });

    const mobileCloseBtn = document.querySelector('.mobile-close-btn');
  if (mobileCloseBtn && mobileMenu) {
    mobileCloseBtn.addEventListener('click', () => {
      mobileMenu.classList.remove('open');
    });
  }

  // ---- MOBILE DROPDOWNS ----
  const mobileDropdownBtns = document.querySelectorAll('.mobile-dropdown-btn');
  mobileDropdownBtns.forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.stopPropagation();
      const content = btn.nextElementSibling;
      const isOpen = content.classList.contains('open');
      // close all others first
      document.querySelectorAll('.mobile-dropdown-content').forEach(c => c.classList.remove('open'));
      document.querySelectorAll('.mobile-dropdown-btn').forEach(b => {
        b.setAttribute('aria-expanded', 'false');
        b.querySelector('i').style.transform = 'rotate(0deg)';
      });
      // toggle current
      if (!isOpen) {
        content.classList.add('open');
        btn.setAttribute('aria-expanded', 'true');
        btn.querySelector('i').style.transform = 'rotate(180deg)';
      }
    });
  });

  // ---- RTL TOGGLE (Global) ----
  const rtlBtns = document.querySelectorAll('.rtl-toggle-btn');

  const MIRROR_KEY = 'portal-mirror';

  const applyMirror = (mirrored) => {
    if (mirrored) {
      document.documentElement.dir = 'rtl';
      document.body.classList.add('rtl-active');
      
      // Also apply to portal layout if it exists
      const portalLayout = document.querySelector('.portal-layout');
      if (portalLayout) portalLayout.classList.add('portal-rtl-active');
      
      rtlBtns.forEach(btn => { btn.textContent = 'LTR'; });
    } else {
      document.documentElement.dir = 'ltr';
      document.body.classList.remove('rtl-active');
      
      // Remove from portal layout if it exists
      const portalLayout = document.querySelector('.portal-layout');
      if (portalLayout) portalLayout.classList.remove('portal-rtl-active');
      
      rtlBtns.forEach(btn => { btn.textContent = 'RTL'; });
    }
  };

  const mirrorState = () => localStorage.getItem(MIRROR_KEY) === '1';

  // No longer restrict to resize/mobile. Apply everywhere.

  // Restore saved state
  if (mirrorState()) applyMirror(true);

  rtlBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const next = !mirrorState();
      localStorage.setItem(MIRROR_KEY, next ? '1' : '0');
      applyMirror(next);
    });
  });
});







// Blog Filter Logic
document.addEventListener('DOMContentLoaded', () => {
  const filterTabs = document.querySelectorAll('.filter-tab');
  const articles = document.querySelectorAll('.article-card');

  if (filterTabs.length > 0 && articles.length > 0) {
    filterTabs.forEach(tab => {
      tab.addEventListener('click', () => {
        // Remove active class from all tabs
        filterTabs.forEach(t => t.classList.remove('active'));
        // Add active class to clicked tab
        tab.classList.add('active');

        const filterCategory = tab.textContent.trim().toLowerCase();

        articles.forEach(article => {
          const tagElement = article.querySelector('.blog-tag');
          if (!tagElement) return;
          
          const tag = tagElement.textContent.trim().toLowerCase();
          
          if (filterCategory === 'all articles' || tag.includes(filterCategory) || filterCategory.includes(tag)) {
            article.style.display = 'grid'; // .article-card is display: grid
          } else {
            article.style.display = 'none';
          }
        });
      });
    });
  }
});

// Blog Search Input Logic
document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('blogSearchInput');
  const articles = document.querySelectorAll('.article-card');

  if (searchInput && articles.length > 0) {
    searchInput.addEventListener('input', (e) => {
      const searchTerm = e.target.value.toLowerCase().trim();
      
      // Also reset the category filter tabs when typing
      const filterTabs = document.querySelectorAll('.filter-tab');
      filterTabs.forEach(t => t.classList.remove('active'));
      if(filterTabs.length > 0) {
        filterTabs[0].classList.add('active'); // Set "All Articles" as visually active
      }

      articles.forEach(article => {
        const titleElement = article.querySelector('h3');
        const descElement = article.querySelector('p');
        const tagElement = article.querySelector('.blog-tag');
        
        const title = titleElement ? titleElement.textContent.toLowerCase() : '';
        const desc = descElement ? descElement.textContent.toLowerCase() : '';
        const tag = tagElement ? tagElement.textContent.toLowerCase() : '';
        
        if (title.includes(searchTerm) || desc.includes(searchTerm) || tag.includes(searchTerm)) {
          article.style.display = 'grid';
        } else {
          article.style.display = 'none';
        }
      });
    });
  }
});
