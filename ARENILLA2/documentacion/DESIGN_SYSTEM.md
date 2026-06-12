# Sistema de Diseño - La Arenilla

**Fecha:** 2026-01-28
**Versión:** 1.0

---

## Paleta de Colores

### Colores Principales

| Nombre | Hex | Uso |
|--------|-----|-----|
| **Verde Bosque** | `#2D5A3D` | Color principal, headers, CTAs |
| **Verde Claro** | `#4A7C5B` | Hover states, acentos |
| **Tierra** | `#8B6914` | Acentos cálidos, iconos |
| **Crema** | `#F5F1E8` | Fondos de secciones alternas |

### Colores Neutros

| Nombre | Hex | Uso |
|--------|-----|-----|
| **Blanco** | `#FFFFFF` | Fondo principal, tarjetas |
| **Gris Texto** | `#333333` | Texto principal |
| **Gris Secundario** | `#666666` | Texto secundario |
| **Gris Claro** | `#E5E5E5` | Bordes, separadores |

### Colores Funcionales

| Nombre | Hex | Uso |
|--------|-----|-----|
| **WhatsApp** | `#25D366` | Botón flotante, CTAs WhatsApp |
| **WhatsApp Hover** | `#1DA851` | Hover del botón |
| **Error** | `#DC3545` | Mensajes de error (si aplica) |

### Variables CSS

```css
:root {
  /* Principales */
  --color-primary: #2D5A3D;
  --color-primary-light: #4A7C5B;
  --color-accent: #8B6914;
  --color-background-alt: #F5F1E8;
  
  /* Neutros */
  --color-white: #FFFFFF;
  --color-text: #333333;
  --color-text-secondary: #666666;
  --color-border: #E5E5E5;
  
  /* Funcionales */
  --color-whatsapp: #25D366;
  --color-whatsapp-hover: #1DA851;
}
```

---

## Tipografía

### Fuentes

| Tipo | Fuente | Fallback | Uso |
|------|--------|----------|-----|
| **Títulos** | Montserrat | system-ui, sans-serif | h1, h2, h3, nav |
| **Cuerpo** | Open Sans | system-ui, sans-serif | Párrafos, botones |

### Carga de Fuentes (Google Fonts)

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
```

### Escala Tipográfica (Mobile-First)

| Elemento | Móvil | Desktop | Peso | Fuente |
|----------|-------|---------|------|--------|
| h1 | 2rem (32px) | 3rem (48px) | 700 | Montserrat |
| h2 | 1.75rem (28px) | 2.25rem (36px) | 700 | Montserrat |
| h3 | 1.25rem (20px) | 1.5rem (24px) | 600 | Montserrat |
| Body | 1rem (16px) | 1rem (16px) | 400 | Open Sans |
| Body Large | 1.125rem (18px) | 1.25rem (20px) | 400 | Open Sans |
| Small | 0.875rem (14px) | 0.875rem (14px) | 400 | Open Sans |
| Button | 1rem (16px) | 1rem (16px) | 600 | Open Sans |

### Variables CSS

```css
:root {
  /* Fuentes */
  --font-heading: 'Montserrat', system-ui, sans-serif;
  --font-body: 'Open Sans', system-ui, sans-serif;
  
  /* Tamaños - Móvil */
  --text-h1: 2rem;
  --text-h2: 1.75rem;
  --text-h3: 1.25rem;
  --text-body: 1rem;
  --text-body-lg: 1.125rem;
  --text-small: 0.875rem;
  
  /* Line heights */
  --leading-tight: 1.2;
  --leading-normal: 1.5;
  --leading-relaxed: 1.75;
}

/* Desktop overrides */
@media (min-width: 1024px) {
  :root {
    --text-h1: 3rem;
    --text-h2: 2.25rem;
    --text-h3: 1.5rem;
    --text-body-lg: 1.25rem;
  }
}
```

---

## Espaciado

### Sistema de Espaciado (8px base)

| Token | Valor | Uso |
|-------|-------|-----|
| --space-1 | 0.25rem (4px) | Micro espacios |
| --space-2 | 0.5rem (8px) | Espacios pequeños |
| --space-3 | 0.75rem (12px) | - |
| --space-4 | 1rem (16px) | Padding interno componentes |
| --space-5 | 1.25rem (20px) | - |
| --space-6 | 1.5rem (24px) | Gap entre elementos |
| --space-8 | 2rem (32px) | Separación secciones móvil |
| --space-10 | 2.5rem (40px) | - |
| --space-12 | 3rem (48px) | Padding secciones móvil |
| --space-16 | 4rem (64px) | - |
| --space-20 | 5rem (80px) | Padding secciones desktop |

### Variables CSS

```css
:root {
  --space-1: 0.25rem;
  --space-2: 0.5rem;
  --space-3: 0.75rem;
  --space-4: 1rem;
  --space-5: 1.25rem;
  --space-6: 1.5rem;
  --space-8: 2rem;
  --space-10: 2.5rem;
  --space-12: 3rem;
  --space-16: 4rem;
  --space-20: 5rem;
}
```

---

## Componentes

### Botones

```css
/* Botón Primario */
.btn-primary {
  background-color: var(--color-primary);
  color: var(--color-white);
  padding: var(--space-3) var(--space-6);
  border-radius: 8px;
  font-family: var(--font-body);
  font-weight: 600;
  font-size: var(--text-body);
  border: none;
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.btn-primary:hover {
  background-color: var(--color-primary-light);
}

/* Botón WhatsApp */
.btn-whatsapp {
  background-color: var(--color-whatsapp);
  color: var(--color-white);
  /* resto igual que btn-primary */
}

.btn-whatsapp:hover {
  background-color: var(--color-whatsapp-hover);
}
```

### Tarjetas

```css
.card {
  background: var(--color-white);
  border-radius: 12px;
  padding: var(--space-6);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
}
```

### Sombras

```css
:root {
  --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.08);
  --shadow-md: 0 2px 8px rgba(0, 0, 0, 0.08);
  --shadow-lg: 0 4px 16px rgba(0, 0, 0, 0.12);
  --shadow-xl: 0 8px 24px rgba(0, 0, 0, 0.15);
}
```

### Border Radius

```css
:root {
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-full: 9999px;
}
```

---

## Breakpoints

```css
/* Mobile first - no media query needed for base */

/* Tablet */
@media (min-width: 768px) { }

/* Desktop */
@media (min-width: 1024px) { }

/* Large Desktop */
@media (min-width: 1440px) { }
```

### Variables para referencia

```css
:root {
  --breakpoint-sm: 320px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 1024px;
  --breakpoint-xl: 1440px;
  
  --container-max: 1200px;
}
```

---

## Iconos

### Enfoque: Emojis + SVG mínimos

Para mantener el sitio ligero, usar:
- **Emojis** para servicios (🏠 ⛺ 🥾 🍲 🌱 🥬)
- **SVG inline** solo para: hamburger menu, X cerrar, WhatsApp logo, flechas

### SVG WhatsApp

```html
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
  <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413z"/>
</svg>
```

---

## Justificación de Decisiones

| Decisión | Razón |
|----------|-------|
| Verde bosque como primario | Refleja naturaleza, ecoturismo, zona montañosa |
| Tonos tierra como acento | Conecta con lo agrícola y artesanal |
| Montserrat para títulos | Moderna pero amigable, buena legibilidad |
| Open Sans para cuerpo | Excelente legibilidad en pantallas, muy ligera |
| Sistema 8px | Estándar de la industria, escalable |
| Emojis sobre iconos | Más ligero, universalmente entendido, carga rápida |
