# PLAN DE TRABAJO

**Proyecto:** Sitio Web La Arenilla
**Clasificación:** INTERMEDIO
**Fecha de creación:** 2026-01-28
**Estado:** EN EJECUCIÓN

---

## Objetivo
Crear sitio web funcional para la Asociación Agro Eco Turística de La Arenilla que presente sus servicios, facilite contacto vía WhatsApp y posicione en buscadores locales.

## Entregables Finales
1. Sitio web completo (HTML/CSS/JS) → DoD: Sitio Web
2. Contenido optimizado (textos, meta tags) → DoD: SEO
3. Imágenes optimizadas (WebP con fallback) → DoD: Assets
4. Documentación de uso básico → DoD: Doc

## Fuera de Alcance
- Sistema de reservas automatizado
- Versión en inglés (fase posterior)
- Blog o sección de noticias
- Pasarela de pagos

## Documentos del Proyecto
- WORK_PLAN.md (este archivo)
- PROJECT_STATE.md (estado actual)
- PROJECT_INTELLIGENCE.md (decisiones y supuestos)
- BRIEF.md (contexto del cliente)
- REQUIREMENTS.md (requisitos funcionales)

---

## Fases y Tareas

### Fase 0: Preparación
**Objetivo:** Recopilar información faltante del cliente
**Checkpoint:** NO

| # | Tarea | Estado | DoD | Notas |
|---|-------|--------|-----|-------|
| 0.1 | Preparar lista de información pendiente para cliente | [✓] | Simple | DoD: OK. Ver LISTA_INFORMACION_CLIENTE.md |
| 0.2 | Obtener número WhatsApp oficial | [ ] | Simple | Bloqueante |
| 0.3 | Obtener handle de Instagram | [ ] | Simple | |
| 0.4 | Obtener precios de servicios | [ ] | Simple | Bloqueante |
| 0.5 | Obtener fotografías del lugar | [ ] | Assets | Bloqueante |
| 0.6 | Obtener instrucciones de cómo llegar | [ ] | Simple | |

### Fase 1: Estructura y Diseño
**Objetivo:** Definir arquitectura del sitio y sistema de diseño
**Checkpoint:** SÍ - Aprobar estructura antes de desarrollo

| # | Tarea | Estado | DoD | Notas |
|---|-------|--------|-----|-------|
| 1.1 | Definir mapa del sitio (páginas/secciones) | [✓] | Simple | DoD: OK. Ver SITEMAP.md. Decisión: Single Page |
| 1.2 | Crear wireframes básicos (mobile-first) | [✓] | Visual | DoD: OK. Ver WIREFRAMES.md |
| 1.3 | Definir paleta de colores y tipografía | [✓] | Simple | DoD: OK. Ver DESIGN_SYSTEM.md |
| 1.4 | Definir estructura de carpetas del proyecto | [✓] | Simple | DoD: OK. Ver FOLDER_STRUCTURE.md |

### Fase 2: Desarrollo Base
**Objetivo:** HTML/CSS funcional con contenido placeholder
**Checkpoint:** SÍ - Validar estructura responsive antes de contenido real

| # | Tarea | Estado | DoD | Notas |
|---|-------|--------|-----|-------|
| 2.1 | Crear HTML base con estructura semántica | [ ] | Código | |
| 2.2 | Crear CSS con variables y sistema de diseño | [ ] | Código | Mobile-first |
| 2.3 | Implementar navegación responsive | [ ] | Código | |
| 2.4 | Implementar hero section | [ ] | Código | |
| 2.5 | Implementar sección de servicios | [ ] | Código | |
| 2.6 | Implementar galería de fotos | [ ] | Código | Lazy loading |
| 2.7 | Implementar sección de ubicación/mapa | [ ] | Código | |
| 2.8 | Implementar botón flotante WhatsApp | [ ] | Código | |
| 2.9 | Implementar footer con contacto | [ ] | Código | |

### Fase 3: Contenido y Optimización
**Objetivo:** Sitio con contenido real y optimizado
**Checkpoint:** SÍ - Validar contenido antes de SEO

| # | Tarea | Estado | DoD | Notas |
|---|-------|--------|-----|-------|
| 3.1 | Redactar textos de cada sección | [ ] | Doc | Tono cálido |
| 3.2 | Optimizar imágenes (WebP, compresión) | [ ] | Assets | |
| 3.3 | Integrar contenido real en HTML | [ ] | Código | |
| 3.4 | Configurar mensajes WhatsApp por servicio | [ ] | Simple | |

### Fase 4: SEO y Rendimiento
**Objetivo:** Sitio optimizado para buscadores y carga rápida
**Checkpoint:** NO

| # | Tarea | Estado | DoD | Notas |
|---|-------|--------|-----|-------|
| 4.1 | Agregar meta tags en todas las páginas | [ ] | SEO | |
| 4.2 | Crear sitemap.xml | [ ] | SEO | |
| 4.3 | Crear robots.txt | [ ] | SEO | |
| 4.4 | Agregar schema markup (LocalBusiness) | [ ] | SEO | |
| 4.5 | Verificar Lighthouse > 80 | [ ] | Sitio Web | |
| 4.6 | Minificar CSS/JS | [ ] | Código | |

### Fase 5: Publicación
**Objetivo:** Sitio en producción y documentado
**Checkpoint:** SÍ - Aprobación final antes de publicar

| # | Tarea | Estado | DoD | Notas |
|---|-------|--------|-----|-------|
| 5.1 | Configurar hosting (GitHub Pages o Netlify) | [ ] | Simple | |
| 5.2 | Configurar dominio (si aplica) | [ ] | Simple | |
| 5.3 | Desplegar sitio | [ ] | Sitio Web | |
| 5.4 | Verificar funcionamiento en producción | [ ] | Sitio Web | |
| 5.5 | Crear documentación de uso básico | [ ] | Doc | |
| 5.6 | Entregar al cliente | [ ] | Simple | |

---

## Registro de Checkpoints

| Fase | Fecha | Resultado | Observaciones |
|------|-------|-----------|---------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |
| 5 | | | |

---

## Control de Cambios

| Fecha | Cambio solicitado | Tipo | Impacto | Aprobado |
|-------|-------------------|------|---------|----------|
| | | | | |

---

## Definition of Done Personalizado

### DoD: Sitio Web (Completo)
```
[ ] Todas las secciones implementadas según REQUIREMENTS.md
[ ] Responsive en 320px, 768px, 1024px, 1440px
[ ] Tiempo de carga < 3 segundos en 3G
[ ] Lighthouse Performance > 80
[ ] Lighthouse Accessibility > 80
[ ] Lighthouse SEO > 80
[ ] WhatsApp funcionando correctamente
[ ] Mapa de ubicación visible
[ ] Sin errores en consola
[ ] Probado en Chrome, Firefox, Safari mobile
```

### DoD: SEO
```
[ ] Meta title único por página (< 60 caracteres)
[ ] Meta description única por página (< 160 caracteres)
[ ] Alt text en todas las imágenes
[ ] URLs amigables (sin caracteres especiales)
[ ] sitemap.xml generado y válido
[ ] robots.txt configurado
[ ] Schema markup LocalBusiness implementado
```

### DoD: Assets (Imágenes)
```
[ ] Formato WebP con fallback JPG/PNG
[ ] Tamaño máximo 200KB por imagen
[ ] Dimensiones apropiadas (no escalar en CSS)
[ ] Lazy loading implementado
[ ] Alt text descriptivo
```

### DoD: Código (Componente/Página)
```
[ ] HTML semántico y válido
[ ] CSS sin !important innecesarios
[ ] Mobile-first implementado
[ ] Comentarios en español donde sea necesario
[ ] Sin errores de linting
[ ] Probado en viewport móvil
```
