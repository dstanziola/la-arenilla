# 📖 Guía de Uso - Sitio Web La Arenilla

Manual para actualizar y mantener el sitio web de la Asociación Agro Eco Turística de La Arenilla.

---

## Índice

1. [Información General](#1-información-general)
2. [Cómo Acceder al Sitio](#2-cómo-acceder-al-sitio)
3. [Cambios Más Comunes](#3-cambios-más-comunes)
4. [Reemplazar Fotografías](#4-reemplazar-fotografías)
5. [Formulario de Contacto](#5-formulario-de-contacto)
6. [Solución de Problemas](#6-solución-de-problemas)
7. [Contacto de Soporte](#7-contacto-de-soporte)

---

## 1. Información General

### ¿Qué es este sitio?
Es un sitio web estático (no necesita base de datos ni servidor especial) que muestra los servicios de la asociación y permite que los visitantes los contacten.

### ¿Dónde está alojado?
- **Plataforma:** Netlify (o GitHub Pages)
- **URL:** [Por definir - ej: laarenilla.com]
- **Panel de control:** [Por definir]

### Estructura del sitio
```
El sitio tiene estas secciones:
├── Inicio (Hero)
├── Servicios
├── Galería
├── Cómo Llegar
├── Nosotros
├── Contacto
└── Footer
```

---

## 2. Cómo Acceder al Sitio

### Para ver el sitio público
Simplemente visitar: **[URL del sitio]**

### Para editar el sitio

**Opción A: Netlify (Recomendado)**
1. Ir a [app.netlify.com](https://app.netlify.com)
2. Iniciar sesión con la cuenta de la asociación
3. Click en el nombre del sitio

**Opción B: GitHub**
1. Ir a [github.com](https://github.com)
2. Iniciar sesión
3. Ir al repositorio del sitio

---

## 3. Cambios Más Comunes

### 3.1 Cambiar Número de WhatsApp

El número de WhatsApp aparece en varios lugares. Para cambiarlo:

1. Abrir el archivo `src/index.html`
2. Buscar (Ctrl+F): `50700000000`
3. Reemplazar con el número nuevo (sin espacios ni guiones)
4. Guardar y publicar

**Formato correcto:** `50761234567` (código de país + número)

### 3.2 Cambiar Precios

Los precios están en la sección de Servicios:

1. Abrir `src/index.html`
2. Buscar la tarjeta del servicio (ej: "Cabaña")
3. Modificar el texto dentro de `<li>`
4. Guardar y publicar

**Ejemplo:**
```html
<li>Precio: $50 por noche</li>
```

### 3.3 Cambiar Horarios

1. Abrir `src/index.html`
2. Buscar "horario" o la sección de contacto
3. Modificar el texto
4. Guardar y publicar

### 3.4 Agregar/Quitar un Servicio

Los servicios están organizados en "tarjetas". Para agregar uno nuevo:

1. Copiar una tarjeta existente (todo el bloque `<article class="servicio-card">`)
2. Pegarlo después de la última tarjeta
3. Cambiar: título, descripción, características, enlace de WhatsApp
4. Guardar y publicar

Para quitar un servicio, simplemente eliminar toda la tarjeta correspondiente.

---

## 4. Reemplazar Fotografías

### 4.1 Preparar las fotos

Antes de subir las fotos, optimizarlas:

1. **Tamaño máximo recomendado:** 
   - Hero: 1920x1080 px
   - Galería: 800x600 px
   - Comunidad: 800x600 px

2. **Formato:** JPG o WebP

3. **Tamaño de archivo:** Menos de 200 KB por foto

4. **Herramientas gratuitas para optimizar:**
   - [Squoosh](https://squoosh.app) - En línea
   - [TinyPNG](https://tinypng.com) - En línea

### 4.2 Subir fotos al sitio

**En Netlify:**
1. Ir al panel de Netlify
2. Arrastrar las fotos nuevas a la carpeta `src/assets/img/`
3. Esperar a que se publique automáticamente

**En GitHub:**
1. Ir al repositorio
2. Navegar a `src/assets/img/`
3. Click en "Add file" → "Upload files"
4. Seleccionar las fotos
5. Click en "Commit changes"

### 4.3 Actualizar referencias en el HTML

Si la foto tiene un nombre diferente, actualizar en `index.html`:

**Ejemplo - Cambiar foto de comunidad:**
```html
<!-- Antes -->
<img src="assets/img/comunidad.svg" ...>

<!-- Después -->
<img src="assets/img/mi-nueva-foto.jpg" ...>
```

### 4.4 Nombres de archivos importantes

| Ubicación | Archivo actual | Uso |
|-----------|---------------|-----|
| Hero desktop | `hero-desktop.svg` | Imagen principal grande |
| Hero móvil | `hero-mobile.svg` | Imagen principal celular |
| Galería | `galeria/placeholder-1.svg` a `6` | Fotos de galería |
| Nosotros | `comunidad.svg` | Foto del equipo |

---

## 5. Formulario de Contacto

### 5.1 Configurar Formspree (Primera vez)

El formulario usa Formspree, un servicio gratuito para recibir mensajes.

1. Ir a [formspree.io](https://formspree.io)
2. Crear cuenta gratuita
3. Click en "New Form"
4. Copiar el ID del formulario (ej: `xrgwqolp`)
5. En `index.html`, buscar `YOUR_FORM_ID` y reemplazar con el ID real

**Ejemplo:**
```html
<!-- Antes -->
<form action="https://formspree.io/f/YOUR_FORM_ID" ...>

<!-- Después -->
<form action="https://formspree.io/f/xrgwqolp" ...>
```

### 5.2 Recibir mensajes

Los mensajes del formulario llegarán al correo configurado en Formspree.

**Para cambiar el correo de destino:**
1. Ir a Formspree
2. Seleccionar el formulario
3. Settings → Email
4. Cambiar la dirección

### 5.3 Ver historial de mensajes

Todos los mensajes se guardan en Formspree:
1. Iniciar sesión en Formspree
2. Seleccionar el formulario
3. Ver pestaña "Submissions"

---

## 6. Solución de Problemas

### El sitio no carga
- Verificar conexión a internet
- Esperar 5 minutos (puede estar actualizándose)
- Contactar soporte

### Las fotos no aparecen
- Verificar que el nombre del archivo coincida exactamente
- Verificar que la foto esté en la carpeta correcta
- Los nombres no deben tener espacios ni caracteres especiales

### El formulario no funciona
- Verificar que el ID de Formspree esté correcto
- Verificar en Formspree que el formulario esté activo
- El plan gratuito tiene límite de 50 mensajes/mes

### Los cambios no se ven
- Limpiar caché del navegador (Ctrl+Shift+R)
- Esperar 2-5 minutos después de publicar
- Verificar que los cambios se guardaron correctamente

---

## 7. Contacto de Soporte

Si necesitan ayuda con el sitio:

- **WhatsApp:** [Por definir]
- **Email:** [Por definir]

### Antes de contactar soporte, tener listo:
- Descripción del problema
- Captura de pantalla (si aplica)
- Qué cambio intentaron hacer
- Cuándo comenzó el problema

---

## Glosario

| Término | Significado |
|---------|-------------|
| **HTML** | Lenguaje que estructura el contenido del sitio |
| **CSS** | Lenguaje que da estilo y diseño al sitio |
| **Repositorio** | Carpeta donde se guarda todo el código |
| **Commit** | Guardar cambios con un mensaje descriptivo |
| **Deploy** | Publicar los cambios para que sean visibles |
| **Caché** | Memoria temporal del navegador |

---

## Checklist de Publicación

Antes de publicar cambios, verificar:

- [ ] Los textos no tienen errores ortográficos
- [ ] Los enlaces funcionan correctamente
- [ ] Las fotos cargan bien
- [ ] El sitio se ve bien en celular
- [ ] El número de WhatsApp es correcto
- [ ] El formulario envía correctamente

---

**Última actualización:** Enero 2026  
**Versión:** 1.0
