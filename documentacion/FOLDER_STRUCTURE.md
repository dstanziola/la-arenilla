# Estructura del Proyecto - La Arenilla

```
D:\ARENILLA\
│
├── index.html                 # Página principal (Single Page)
│
├── src/
│   ├── css/
│   │   ├── variables.css      # Variables CSS (colores, espaciado, tipografía)
│   │   ├── reset.css          # Reset/normalize básico
│   │   ├── base.css           # Estilos base (body, tipografía)
│   │   ├── components.css     # Componentes (botones, tarjetas, nav)
│   │   ├── layout.css         # Layout (header, footer, secciones)
│   │   └── main.css           # Archivo principal que importa todos
│   │
│   └── js/
│       └── main.js            # JavaScript (menú, lightbox, scroll)
│
├── assets/
│   ├── images/
│   │   ├── hero/              # Imágenes del hero
│   │   ├── gallery/           # Galería de fotos
│   │   ├── services/          # Iconos/fotos de servicios
│   │   └── about/             # Fotos de la comunidad
│   │
│   └── icons/
│       ├── favicon.ico        # Favicon
│       ├── favicon.svg        # Favicon SVG
│       └── whatsapp.svg       # Logo WhatsApp
│
├── docs/                      # Documentación del proyecto
│   ├── BRIEF.md
│   ├── REQUIREMENTS.md
│   ├── WORK_PLAN.md
│   ├── PROJECT_STATE.md
│   ├── PROJECT_INTELLIGENCE.md
│   ├── SITEMAP.md
│   ├── WIREFRAMES.md
│   ├── DESIGN_SYSTEM.md
│   ├── FOLDER_STRUCTURE.md    # Este archivo
│   └── LISTA_INFORMACION_CLIENTE.md
│
├── claude-project/            # Archivos del proyecto Claude
│   ├── KNOWLEDGE.md
│   ├── BRIEF.md
│   └── REQUIREMENTS.md
│
├── PROJECT_LOG.md             # Historial de sesiones
├── README.md                  # Documentación general
├── robots.txt                 # Para SEO (a crear)
└── sitemap.xml                # Para SEO (a crear)
```

---

## Archivos por Crear (Fase 2)

### HTML
- `index.html` - Página única con todas las secciones

### CSS (en orden de importación)
1. `variables.css` - Custom properties
2. `reset.css` - Normalización
3. `base.css` - Estilos globales
4. `components.css` - Componentes reutilizables
5. `layout.css` - Estructura de página
6. `main.css` - Importa todos los anteriores

### JavaScript
- `main.js` - Funcionalidad:
  - Toggle menú móvil
  - Scroll suave a secciones
  - Lightbox para galería
  - Lazy loading de imágenes

---

## Convenciones de Nombres

### Archivos
- Minúsculas
- Guiones para separar palabras: `design-system.md`
- Sin espacios ni caracteres especiales

### Imágenes
- Formato: `[seccion]-[descripcion]-[numero].[ext]`
- Ejemplos:
  - `hero-paisaje-01.webp`
  - `gallery-cabana-interior-01.webp`
  - `services-camping-01.webp`

### Clases CSS
- BEM simplificado: `componente__elemento--modificador`
- Ejemplos:
  - `.card`
  - `.card__title`
  - `.card--featured`
  - `.btn`
  - `.btn--primary`
  - `.btn--whatsapp`

### IDs (para navegación)
- Minúsculas, sin guiones
- Ejemplos: `#inicio`, `#servicios`, `#galeria`, `#ubicacion`, `#nosotros`

---

## Notas

- **Single CSS file en producción:** En desarrollo usamos archivos separados, pero para producción se concatenan en `main.css`
- **Sin bundlers:** No usamos webpack, vite, etc. - todo vanilla para simplicidad
- **Imágenes:** Se optimizarán antes de subir (WebP + fallback JPG)
