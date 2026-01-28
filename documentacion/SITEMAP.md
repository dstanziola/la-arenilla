# Mapa del Sitio - La Arenilla

**Fecha:** 2026-01-28
**Versión:** 1.0

---

## Estructura de Navegación

```
index.html (Página única - Single Page)
│
├── #inicio (Hero)
│   └── Imagen destacada + CTA WhatsApp
│
├── #servicios
│   ├── Cabaña
│   ├── Camping
│   ├── Guías Turísticos
│   ├── Comidas Criollas
│   ├── Vivero
│   └── Productos Agrícolas
│
├── #galeria
│   └── Grid de fotos con lightbox
│
├── #ubicacion
│   ├── Mapa embebido
│   └── Instrucciones de llegada
│
├── #nosotros
│   └── Historia de la comunidad
│
└── #contacto (Footer)
    ├── WhatsApp
    ├── Instagram
    └── Horarios
```

---

## Decisión: Single Page vs Multi Page

**Elegido:** Single Page Application (SPA estática)

**Justificación:**
- Menos archivos = carga más rápida
- Navegación fluida sin recargas
- Más simple de mantener
- Contenido no es extenso
- Mejor UX en móvil

---

## Secciones Detalladas

### 1. Hero (#inicio)
- Imagen de fondo: paisaje de La Arenilla
- Título: nombre de la asociación
- Subtítulo: ubicación y propuesta de valor
- CTA principal: botón WhatsApp
- CTA secundario: "Ver servicios"

### 2. Servicios (#servicios)
- 6 tarjetas en grid responsive
- Cada tarjeta: icono + nombre + descripción breve + precio + botón WhatsApp
- Orden por prioridad: Cabaña, Camping, Guías, Comidas, Vivero, Productos

### 3. Galería (#galeria)
- Grid de imágenes (3 columnas desktop, 2 tablet, 1 móvil)
- Lightbox al hacer clic
- Lazy loading
- Categorías opcionales (filtros)

### 4. Ubicación (#ubicacion)
- Mapa de Google Maps embebido
- Tarjeta con instrucciones paso a paso
- Tiempo estimado desde Ciudad de Panamá
- Botón "Abrir en Google Maps/Waze"

### 5. Nosotros (#nosotros)
- Historia breve de la comunidad
- Foto del equipo/comunidad
- Misión (opcional)

### 6. Footer (#contacto)
- Logo (si existe)
- Links de navegación
- WhatsApp con número visible
- Instagram con handle
- Horarios de atención
- Copyright

---

## Componentes Flotantes

- **Botón WhatsApp:** Fijo en esquina inferior derecha, siempre visible
- **Navegación móvil:** Hamburger menu fijo en header

---

## SEO: Títulos y Metas

| Sección | Title Tag |
|---------|-----------|
| Principal | La Arenilla - Turismo Rural en Capira, Panamá |
| Meta Desc | Cabaña, camping y ecoturismo en La Arenilla, Cirí Grande. Disfruta de naturaleza, comidas criollas y guías locales. ¡Reserva por WhatsApp! |

---

## Navegación

### Desktop
- Header fijo con logo + links horizontales + botón WhatsApp
- Links: Inicio | Servicios | Galería | Ubicación | Nosotros

### Móvil
- Header fijo con logo + hamburger menu
- Menu desplegable con los mismos links
- Botón WhatsApp flotante separado del menú
