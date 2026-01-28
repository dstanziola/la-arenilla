# 🌿 La Arenilla - Sitio Web

Sitio web para la **Asociación Agro Eco Turística de La Arenilla**, comunidad de turismo rural en Capira, Panamá Oeste.

## 📋 Descripción

Sitio web estático para promocionar los servicios turísticos comunitarios:
- Alquiler de cabaña
- Área de camping
- Guías turísticos
- Comidas criollas
- Vivero de plantas
- Productos agrícolas

## 🚀 Despliegue Rápido

### Opción 1: Netlify (Recomendado)

1. Crear cuenta en [netlify.com](https://netlify.com)
2. Click en "Add new site" → "Import an existing project"
3. Conectar repositorio de GitHub
4. Configuración automática (usa `netlify.toml`)
5. Click en "Deploy site"

**Dominio personalizado:**
- En Netlify: Site settings → Domain management → Add custom domain
- Configurar DNS apuntando a Netlify

### Opción 2: GitHub Pages

1. Subir código a repositorio en GitHub
2. Settings → Pages
3. Source: "Deploy from a branch"
4. Branch: `main` / Folder: `/src`
5. Save

**URL resultante:** `https://usuario.github.io/nombre-repo/`

### Opción 3: Despliegue Manual

Simplemente copiar el contenido de `/src` a cualquier servidor web.

## 📁 Estructura del Proyecto

```
ARENILLA/
├── src/                    # Código fuente del sitio
│   ├── index.html          # Página principal
│   ├── 404.html            # Página de error
│   ├── robots.txt          # SEO
│   ├── sitemap.xml         # Mapa del sitio
│   ├── css/
│   │   └── styles.css      # Estilos
│   ├── js/
│   │   └── main.js         # JavaScript
│   └── assets/
│       ├── favicon.svg
│       └── img/            # Imágenes
├── docs/                   # Documentación
├── claude-project/         # Archivos para Claude AI
├── netlify.toml            # Configuración Netlify
├── .gitignore
├── PROJECT_LOG.md          # Bitácora del proyecto
└── README.md               # Este archivo
```

## 🛠️ Tecnologías

- HTML5
- CSS3 (Custom Properties, Flexbox, Grid)
- JavaScript Vanilla (ES6+)
- SVG para iconos y placeholders

**Sin dependencias externas** - Optimizado para conexiones lentas.

## ⚙️ Personalización

### Cambiar información de contacto

En `src/index.html`, buscar y reemplazar:
- `+507 0000-0000` → Número real de WhatsApp
- `@laarenilla` → Handle real de Instagram
- Coordenadas GPS en el mapa embebido

### Cambiar colores

En `src/css/styles.css`, modificar variables:
```css
:root {
    --color-primary: #2D5A27;      /* Verde principal */
    --color-secondary: #8B5A2B;    /* Marrón */
    --color-accent: #E8A838;       /* Dorado */
}
```

### Reemplazar imágenes placeholder

1. Optimizar imágenes (WebP recomendado, max 200KB)
2. Colocar en `src/assets/img/`
3. Actualizar rutas en `index.html`

## 📱 Responsive

El sitio es mobile-first con breakpoints en:
- 320px (móvil pequeño)
- 480px (móvil)
- 768px (tablet)
- 1024px (desktop)
- 1440px (desktop grande)

## 🔍 SEO

Incluye:
- Meta tags optimizados
- Open Graph para redes sociales
- Schema.org para negocio local
- Sitemap XML
- robots.txt

## 📄 Licencia

Desarrollado para la Asociación Agro Eco Turística de La Arenilla.
Todos los derechos reservados © 2026.

---

**Desarrollado con 💚 para la comunidad de La Arenilla**
