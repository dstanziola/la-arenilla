/**
 * LA ARENILLA - JavaScript Principal
 * Turismo Rural Comunitario | Capira, Panamá
 * 
 * Funcionalidades:
 * - Navegación móvil
 * - Header con efecto scroll
 * - Navegación activa por sección
 * - Filtros de galería
 * - Lightbox para imágenes
 * - Año actual en footer
 * - Google Analytics 4 eventos personalizados
 */

'use strict';

// ==========================================================================
// Utilidades
// ==========================================================================

/**
 * Espera a que el DOM esté listo
 * @param {Function} fn - Función a ejecutar
 */
const domReady = (fn) => {
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', fn);
    } else {
        fn();
    }
};

/**
 * Selecciona un elemento del DOM
 * @param {string} selector 
 * @param {Element} parent 
 * @returns {Element|null}
 */
const $ = (selector, parent = document) => parent.querySelector(selector);

/**
 * Selecciona múltiples elementos del DOM
 * @param {string} selector 
 * @param {Element} parent 
 * @returns {NodeList}
 */
const $$ = (selector, parent = document) => parent.querySelectorAll(selector);

// ==========================================================================
// Navegación Móvil
// ==========================================================================

const initMobileNav = () => {
    const navToggle = $('#nav-toggle');
    const navClose = $('#nav-close');
    const navMenu = $('#nav-menu');
    const navLinks = $$('.nav__link');
    
    if (!navToggle || !navMenu) return;
    
    // Crear overlay
    const overlay = document.createElement('div');
    overlay.className = 'nav-overlay';
    document.body.appendChild(overlay);
    
    // Abrir menú
    const openMenu = () => {
        navMenu.classList.add('active');
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden';
    };
    
    // Cerrar menú
    const closeMenu = () => {
        navMenu.classList.remove('active');
        overlay.classList.remove('active');
        document.body.style.overflow = '';
    };
    
    // Event listeners
    navToggle.addEventListener('click', openMenu);
    navClose?.addEventListener('click', closeMenu);
    overlay.addEventListener('click', closeMenu);
    
    // Cerrar al hacer click en un enlace
    navLinks.forEach(link => {
        link.addEventListener('click', closeMenu);
    });
    
    // Cerrar con tecla Escape
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && navMenu.classList.contains('active')) {
            closeMenu();
        }
    });
};

// ==========================================================================
// Header Scroll Effect
// ==========================================================================

const initHeaderScroll = () => {
    const header = $('#header');
    if (!header) return;
    
    const scrollThreshold = 50;
    
    const handleScroll = () => {
        if (window.scrollY > scrollThreshold) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    };
    
    // Ejecutar al cargar
    handleScroll();
    
    // Throttle para mejor rendimiento
    let ticking = false;
    window.addEventListener('scroll', () => {
        if (!ticking) {
            window.requestAnimationFrame(() => {
                handleScroll();
                ticking = false;
            });
            ticking = true;
        }
    }, { passive: true });
};

// ==========================================================================
// Navegación Activa por Sección
// ==========================================================================

const initActiveNavOnScroll = () => {
    const sections = $$('section[id]');
    const navLinks = $$('.nav__link');
    
    if (!sections.length || !navLinks.length) return;
    
    const observerOptions = {
        root: null,
        rootMargin: '-50% 0px -50% 0px',
        threshold: 0
    };
    
    const observerCallback = (entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const id = entry.target.getAttribute('id');
                
                navLinks.forEach(link => {
                    link.classList.remove('active');
                    if (link.getAttribute('href') === `#${id}`) {
                        link.classList.add('active');
                    }
                });
            }
        });
    };
    
    const observer = new IntersectionObserver(observerCallback, observerOptions);
    
    sections.forEach(section => {
        observer.observe(section);
    });
};

// ==========================================================================
// Galería - Filtros
// ==========================================================================

const initGalleryFilters = () => {
    // Soporta ambas clases: .galeria__filtro (index) y .galeria-filtro (página galería)
    const filtros = $$('.galeria__filtro, .galeria-filtro');
    const items = $$('.galeria__item');
    
    if (!filtros.length || !items.length) return;
    
    filtros.forEach(filtro => {
        filtro.addEventListener('click', () => {
            const filter = filtro.dataset.filter;
            
            // Actualizar estado activo
            filtros.forEach(f => f.classList.remove('active'));
            filtro.classList.add('active');
            
            // Filtrar items (solo con clases CSS)
            items.forEach(item => {
                const category = item.dataset.category;
                
                if (filter === 'todos' || category === filter) {
                    item.classList.remove('hidden');
                } else {
                    item.classList.add('hidden');
                }
            });
            
            // Track en Analytics
            if (typeof trackEvent === 'function') {
                trackEvent('filtro_galeria', { categoria: filter });
            }
        });
    });
};

// ==========================================================================
// Lightbox
// ==========================================================================

const initLightbox = () => {
    const lightbox = $('#lightbox');
    const lightboxImg = $('.lightbox__img', lightbox);
    const lightboxCaption = $('.lightbox__caption', lightbox);
    const closeBtn = $('.lightbox__close', lightbox);
    const prevBtn = $('.lightbox__prev', lightbox);
    const nextBtn = $('.lightbox__next', lightbox);
    const galleryItems = $$('.galeria__item');
    
    if (!lightbox || !galleryItems.length) return;
    
    let currentIndex = 0;
    let visibleItems = [];
    
    // Obtener items visibles (no filtrados)
    const getVisibleItems = () => {
        return Array.from(galleryItems).filter(item => !item.classList.contains('hidden'));
    };
    
    // Abrir lightbox
    const openLightbox = (index) => {
        visibleItems = getVisibleItems();
        currentIndex = index;
        updateLightboxContent();
        lightbox.classList.add('active');
        document.body.style.overflow = 'hidden';
    };
    
    // Cerrar lightbox
    const closeLightbox = () => {
        lightbox.classList.remove('active');
        document.body.style.overflow = '';
    };
    
    // Actualizar contenido
    const updateLightboxContent = () => {
        const item = visibleItems[currentIndex];
        if (!item) return;
        
        const img = $('img', item);
        const caption = $('figcaption', item);
        
        lightboxImg.src = img.src;
        lightboxImg.alt = img.alt;
        lightboxCaption.textContent = caption?.textContent || '';
    };
    
    // Navegación
    const showPrev = () => {
        currentIndex = (currentIndex - 1 + visibleItems.length) % visibleItems.length;
        updateLightboxContent();
    };
    
    const showNext = () => {
        currentIndex = (currentIndex + 1) % visibleItems.length;
        updateLightboxContent();
    };
    
    // Event listeners para galería
    galleryItems.forEach((item, index) => {
        item.addEventListener('click', () => {
            const visibleIndex = getVisibleItems().indexOf(item);
            if (visibleIndex !== -1) {
                openLightbox(visibleIndex);
            }
        });
        
        // Accesibilidad
        item.setAttribute('tabindex', '0');
        item.setAttribute('role', 'button');
        item.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                const visibleIndex = getVisibleItems().indexOf(item);
                if (visibleIndex !== -1) {
                    openLightbox(visibleIndex);
                }
            }
        });
    });
    
    // Event listeners para lightbox
    closeBtn?.addEventListener('click', closeLightbox);
    prevBtn?.addEventListener('click', showPrev);
    nextBtn?.addEventListener('click', showNext);
    
    // Cerrar al hacer click fuera
    lightbox.addEventListener('click', (e) => {
        if (e.target === lightbox) {
            closeLightbox();
        }
    });
    
    // Navegación con teclado
    document.addEventListener('keydown', (e) => {
        if (!lightbox.classList.contains('active')) return;
        
        switch (e.key) {
            case 'Escape':
                closeLightbox();
                break;
            case 'ArrowLeft':
                showPrev();
                break;
            case 'ArrowRight':
                showNext();
                break;
        }
    });
    
    // Soporte para swipe en móvil
    let touchStartX = 0;
    let touchEndX = 0;
    
    lightbox.addEventListener('touchstart', (e) => {
        touchStartX = e.changedTouches[0].screenX;
    }, { passive: true });
    
    lightbox.addEventListener('touchend', (e) => {
        touchEndX = e.changedTouches[0].screenX;
        handleSwipe();
    }, { passive: true });
    
    const handleSwipe = () => {
        const swipeThreshold = 50;
        const diff = touchStartX - touchEndX;
        
        if (Math.abs(diff) > swipeThreshold) {
            if (diff > 0) {
                showNext();
            } else {
                showPrev();
            }
        }
    };
};

// ==========================================================================
// Año Actual en Footer
// ==========================================================================

const initCurrentYear = () => {
    const yearElement = $('#current-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
};

// ==========================================================================
// Smooth Scroll para enlaces ancla
// ==========================================================================

const initSmoothScroll = () => {
    const anchorLinks = $$('a[href^="#"]');
    
    anchorLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            const href = link.getAttribute('href');
            
            // Ignorar enlaces vacíos o solo #
            if (!href || href === '#') return;
            
            const target = $(href);
            if (target) {
                e.preventDefault();
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
};

// ==========================================================================
// Lazy Loading para imágenes (fallback para navegadores sin soporte nativo)
// ==========================================================================

const initLazyLoading = () => {
    // Solo si el navegador no soporta loading="lazy"
    if ('loading' in HTMLImageElement.prototype) return;
    
    const lazyImages = $$('img[loading="lazy"]');
    
    if (!lazyImages.length) return;
    
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src || img.src;
                observer.unobserve(img);
            }
        });
    });
    
    lazyImages.forEach(img => imageObserver.observe(img));
};

// ==========================================================================
// Google Analytics 4 - Eventos Personalizados
// ==========================================================================

/**
 * Envía un evento a Google Analytics 4
 * @param {string} eventName - Nombre del evento
 * @param {Object} params - Parámetros adicionales
 */
const trackEvent = (eventName, params = {}) => {
    if (typeof gtag === 'function') {
        gtag('event', eventName, params);
    }
};

const initAnalyticsTracking = () => {
    // ----- Tracking de clics en WhatsApp -----
    const whatsappLinks = $$('a[href*="wa.me"]');
    
    whatsappLinks.forEach(link => {
        link.addEventListener('click', () => {
            // Detectar servicio según el texto del mensaje (URL-encoded o normal)
            const href = link.getAttribute('href');
            let servicio = 'general';
            
            if (href.includes('caba%C3%B1a') || href.includes('cabaña')) servicio = 'cabana';
            else if (href.includes('camping')) servicio = 'camping';
            else if (href.includes('cascada')) servicio = 'tour_cascada';
            else if (href.includes('Cerro')) servicio = 'tour_cerro';
            else if (href.includes('comida')) servicio = 'comidas';
            else if (href.includes('vivero') || href.includes('plantas')) servicio = 'vivero';
            else if (href.includes('agr%C3%ADcolas') || href.includes('agrícolas')) servicio = 'productos';
            else if (href.includes('planificar')) servicio = 'cta_final';
            
            // Detectar ubicación del botón
            const isFloating = link.classList.contains('whatsapp-float');
            const ubicacion = isFloating ? 'boton_flotante' : 'seccion';
            
            trackEvent('contacto_whatsapp', {
                servicio: servicio,
                ubicacion: ubicacion
            });
        });
    });
    
    // ----- Tracking de envío del formulario -----
    const contactForm = $('#contact-form');
    
    if (contactForm) {
        contactForm.addEventListener('submit', () => {
            const servicioSelect = $('#servicio');
            const servicioSeleccionado = servicioSelect?.value || 'no_especificado';
            
            trackEvent('formulario_enviado', {
                servicio_interes: servicioSeleccionado
            });
        });
    }
    
    // ----- Tracking de clics en mapas -----
    const googleMapsLinks = $$('a[href*="maps.google.com"], a[href*="google.com/maps"]');
    const wazeLinks = $$('a[href*="waze.com"]');
    
    googleMapsLinks.forEach(link => {
        link.addEventListener('click', () => {
            trackEvent('abrir_mapa', { plataforma: 'google_maps' });
        });
    });
    
    wazeLinks.forEach(link => {
        link.addEventListener('click', () => {
            trackEvent('abrir_mapa', { plataforma: 'waze' });
        });
    });
    
    // ----- Tracking de galería -----
    const galleryItems = $$('.galeria__item');
    
    galleryItems.forEach(item => {
        item.addEventListener('click', () => {
            const caption = $('figcaption', item)?.textContent || 'sin_titulo';
            trackEvent('ver_imagen_galeria', { imagen: caption });
        });
    });
    
    // ----- Tracking de redes sociales -----
    const instagramLinks = $$('a[href*="instagram.com"]');
    const facebookLinks = $$('a[href*="facebook.com"]');
    
    instagramLinks.forEach(link => {
        link.addEventListener('click', () => {
            trackEvent('clic_red_social', { red: 'instagram' });
        });
    });
    
    facebookLinks.forEach(link => {
        link.addEventListener('click', () => {
            trackEvent('clic_red_social', { red: 'facebook' });
        });
    });
};

// ==========================================================================
// Inicialización
// ==========================================================================

domReady(() => {
    initMobileNav();
    initHeaderScroll();
    initActiveNavOnScroll();
    initGalleryFilters();
    initLightbox();
    initCurrentYear();
    initSmoothScroll();
    initLazyLoading();
    initAnalyticsTracking();
    
    console.log('🌿 La Arenilla - Sitio cargado correctamente');
});
