# PROJECT INTELLIGENCE LOG

**Proyecto:** Sitio Web La Arenilla
**Clasificación:** INTERMEDIO
**Fecha de creación:** 2026-01-28

---

## Decisiones

| ID | Fecha | Decisión | Justificación | Impacto |
|----|-------|----------|---------------|---------|
| D-001 | 2026-01-28 | Stack: HTML/CSS/JS vanilla sin frameworks | Priorizar velocidad de carga en conexiones lentas, minimizar complejidad de mantenimiento | Alto - Define arquitectura |
| D-002 | 2026-01-28 | Hosting: GitHub Pages o Netlify (gratuito) | Presupuesto mínimo del cliente, SSL incluido, suficiente para sitio estático | Medio - Define infraestructura |
| D-003 | 2026-01-28 | Contacto principal vía WhatsApp, no formulario web | Comunidad con conectividad limitada, WhatsApp es canal habitual del cliente | Alto - Define UX de contacto |
| D-004 | 2026-01-28 | Desarrollo paralelo con placeholders | Permite avanzar Fases 1-2 mientras se recopila información del cliente | Medio - Acelera timeline |
| D-005 | 2026-01-28 | Single Page (no multi-page) | Contenido no extenso, mejor UX móvil, carga más rápida, más simple de mantener | Alto - Define arquitectura |
| D-006 | 2026-01-28 | Emojis para iconos de servicios (no SVG/font icons) | Más ligero, carga instantánea, universalmente entendido | Bajo - Define assets |
| D-007 | 2026-01-28 | CSS modular (6 archivos) concatenados en main.css | Facilita desarrollo y mantenimiento sin necesidad de bundlers | Bajo - Define workflow |

---

## Supuestos

| ID | Fecha | Supuesto | Estado | Validación |
|----|-------|----------|--------|------------|
| S-001 | 2026-01-28 | Cliente tiene acceso a WhatsApp Business | 🟡 Activo | Confirmar con cliente |
| S-002 | 2026-01-28 | Cliente puede proporcionar fotografías de calidad aceptable | 🟡 Activo | Evaluar al recibir |
| S-003 | 2026-01-28 | Ubicación tiene coordenadas en Google Maps | 🟡 Activo | Verificar con cliente |
| S-004 | 2026-01-28 | Cliente no requiere dominio .pa (acepta .com o subdominio gratuito) | 🟡 Activo | Confirmar preferencia |
| S-005 | 2026-01-28 | Servicios tienen precios fijos (no requieren cotización personalizada) | 🟡 Activo | Confirmar con cliente |

**Estados:** 🟢 Confirmado | 🟡 Activo | 🔴 Invalidado

---

## Riesgos

| ID | Fecha | Riesgo | Probabilidad | Impacto | Mitigación | Estado |
|----|-------|--------|--------------|---------|------------|--------|
| R-001 | 2026-01-28 | Cliente no proporciona información a tiempo | Media | Alto | Avanzar con placeholders, definir deadline para contenido | 🟡 Activo |
| R-002 | 2026-01-28 | Fotografías de baja calidad o insuficientes | Media | Medio | Usar imágenes de stock como fallback, solicitar múltiples tomas | 🟡 Activo |
| R-003 | 2026-01-28 | Ubicación no aparece en Google Maps | Baja | Medio | Usar coordenadas manuales, crear instrucciones detalladas | 🟡 Activo |
| R-004 | 2026-01-28 | Cliente no puede mantener el sitio después de entrega | Media | Bajo | Documentación clara, diseño que requiera mínimas actualizaciones | 🟡 Activo |

**Estados:** 🟢 Mitigado | 🟡 Activo | 🔴 Materializado

---

## Lecciones Aprendidas

| Fecha | Contexto | Lección | Aplicación |
|-------|----------|---------|------------|
| | | | |

---

## Dependencias Externas

| Dependencia | Responsable | Estado | Fecha límite |
|-------------|-------------|--------|--------------|
| Información del cliente (WhatsApp, precios, fotos) | Cliente | ⏳ Pendiente | Por definir |
| Decisión de dominio | Cliente | ⏳ Pendiente | Antes de Fase 5 |
| Acceso a cuenta hosting | Agustin | ⏳ Pendiente | Antes de Fase 5 |

---

## Notas Técnicas

### Consideraciones de Performance
- Target: < 3s en 3G
- Imágenes: WebP con fallback, max 200KB
- CSS/JS: Minificado, sin dependencias externas pesadas
- Lazy loading obligatorio para galería

### Consideraciones SEO
- Keywords principales: "turismo rural Panamá", "ecoturismo Capira", "camping Panamá Oeste"
- Schema markup: LocalBusiness
- Meta descriptions únicas por sección

### Consideraciones de Accesibilidad
- Contraste mínimo WCAG AA
- Alt text en todas las imágenes
- Navegación por teclado funcional
- Touch targets mínimo 44px
