# Requisitos Funcionales

## RF01 - Página de Inicio

### Descripción
Landing page que presente la asociación y sus servicios principales.

### Criterios de aceptación
- [ ] Hero section con imagen destacada y llamado a acción
- [ ] Resumen de servicios con iconos
- [ ] Botón flotante de WhatsApp
- [ ] Sección de ubicación con mapa
- [ ] Testimonios destacados (si disponibles)

---

## RF02 - Sección de Servicios

### Descripción
Presentación detallada de cada servicio ofrecido.

### Criterios de aceptación
- [ ] Tarjetas individuales por servicio
- [ ] Descripción, fotos y precios (si aplica)
- [ ] Botón de contacto por servicio
- [ ] Información de disponibilidad

### Servicios a incluir
1. Alquiler de cabaña
2. Sitio para acampar
3. Guías turísticos
4. Comidas criollas
5. Vivero de plantas
6. Productos agrícolas

---

## RF03 - Galería de Fotos

### Descripción
Muestra visual del lugar y actividades.

### Criterios de aceptación
- [ ] Grid responsive de imágenes
- [ ] Lightbox para ver fotos ampliadas
- [ ] Categorías: Paisajes, Cabaña, Camping, Actividades, Gastronomía
- [ ] Optimización de carga (lazy loading)

---

## RF04 - Contacto e Integración WhatsApp

### Descripción
Facilitar comunicación directa con la asociación.

### Criterios de aceptación
- [ ] Botón flotante de WhatsApp en todas las páginas
- [ ] Mensaje pre-formateado según servicio de interés
- [ ] Formulario de contacto alternativo
- [ ] Información de contacto visible (teléfono, email si existe)

---

## RF05 - Ubicación y Cómo Llegar

### Descripción
Orientar a visitantes sobre la ubicación.

### Criterios de aceptación
- [ ] Mapa interactivo (Google Maps embed)
- [ ] Instrucciones de cómo llegar desde Ciudad de Panamá
- [ ] Puntos de referencia
- [ ] Tiempo estimado de viaje
- [ ] Enlace a Google Maps/Waze

---

## RF06 - Sobre Nosotros

### Descripción
Historia y misión de la asociación.

### Criterios de aceptación
- [ ] Historia de la comunidad y la asociación
- [ ] Misión y visión
- [ ] Fotos del equipo/comunidad
- [ ] Impacto comunitario

---

## RF07 - Responsive Design

### Descripción
Adaptación a todos los dispositivos.

### Criterios de aceptación
- [ ] Mobile-first design
- [ ] Breakpoints: 320px, 768px, 1024px, 1440px
- [ ] Navegación hamburger en móvil
- [ ] Imágenes adaptativas
- [ ] Touch-friendly (botones mínimo 44px)

---

## RF08 - SEO Básico

### Descripción
Optimización para motores de búsqueda.

### Criterios de aceptación
- [ ] Meta tags en todas las páginas
- [ ] Títulos descriptivos únicos
- [ ] URLs amigables
- [ ] Sitemap.xml
- [ ] robots.txt
- [ ] Schema markup para negocio local
- [ ] Alt text en todas las imágenes

---

## RF09 - Rendimiento

### Descripción
Carga rápida especialmente en conexiones lentas.

### Criterios de aceptación
- [ ] Tiempo de carga < 3 segundos en 3G
- [ ] Imágenes comprimidas (WebP con fallback)
- [ ] CSS/JS minificados
- [ ] Lazy loading de imágenes
- [ ] Score Lighthouse > 80

---

## Requisitos No Funcionales

### RNF01 - Hosting
- Gratuito o muy bajo costo
- SSL incluido
- Uptime > 99%

### RNF02 - Mantenimiento
- Actualización de contenido sin conocimientos técnicos
- Documentación clara

### RNF03 - Escalabilidad
- Estructura que permita agregar idioma inglés
- Posibilidad de agregar blog posteriormente
- Integración futura con sistema de reservas

---

## Matriz de Priorización

| ID | Requisito | Prioridad | Complejidad |
|----|-----------|-----------|-------------|
| RF01 | Página de Inicio | 🔴 Alta | Media |
| RF02 | Servicios | 🔴 Alta | Media |
| RF04 | WhatsApp | 🔴 Alta | Baja |
| RF05 | Ubicación | 🔴 Alta | Baja |
| RF07 | Responsive | 🔴 Alta | Media |
| RF03 | Galería | 🟡 Media | Media |
| RF06 | Sobre Nosotros | 🟡 Media | Baja |
| RF08 | SEO | 🟡 Media | Media |
| RF09 | Rendimiento | 🟡 Media | Media |
