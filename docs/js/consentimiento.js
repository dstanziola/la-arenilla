/* Aviso de cookies de arenilla.online (26-oct-2026).
   Google Analytics (G-XRJ4J4N73L) se carga solo después de «Aceptar». Antes no sale ninguna petición a Google.
   La decisión se guarda en este navegador (localStorage) y se puede cambiar con «Preferencias de cookies». */
(function () {
    var CLAVE = 'arenilla_consentimiento', ID = 'G-XRJ4J4N73L';
    window.dataLayer = window.dataLayer || [];
    window.gtag = window.gtag || function () { window.dataLayer.push(arguments); };
    function leer() { try { return localStorage.getItem(CLAVE); } catch (e) { return null; } }
    function guardar(v) { try { localStorage.setItem(CLAVE, v); } catch (e) {} }
    function cargar() {
        if (window.__arenillaGA) { return; }
        window.__arenillaGA = true;
        var s = document.createElement('script');
        s.async = true;
        s.src = 'https://www.googletagmanager.com/gtag/js?id=' + ID;
        document.head.appendChild(s);
        gtag('js', new Date());
        gtag('config', ID);
    }
    function aviso() {
        if (document.getElementById('consentimiento')) { return; }
        var d = document.createElement('div');
        d.id = 'consentimiento';
        d.className = 'consentimiento';
        d.setAttribute('role', 'dialog');
        d.setAttribute('aria-label', 'Aviso de cookies');
        d.innerHTML = '<p>Usamos Google Analytics para contar las visitas de forma agregada, solo si aceptas. Consulta la <a href="privacidad.html">Política de privacidad</a> para conocer más.</p>' +
            '<div class="consentimiento__botones"><button type="button" class="consentimiento__rechazar">Rechazar</button><button type="button" class="consentimiento__aceptar">Aceptar</button></div>';
        document.body.appendChild(d);
        document.body.classList.add('con-aviso');
        d.querySelector('.consentimiento__aceptar').addEventListener('click', function () { guardar('aceptado'); cerrar(d); cargar(); });
        d.querySelector('.consentimiento__rechazar').addEventListener('click', function () {
            var antes = leer();
            guardar('rechazado');
            cerrar(d);
            if (antes === 'aceptado' && window.__arenillaGA) { location.reload(); }
        });
    }
    function cerrar(d) { d.remove(); document.body.classList.remove('con-aviso'); }
    if (leer() === 'aceptado') { cargar(); }
    document.addEventListener('DOMContentLoaded', function () {
        if (!leer()) { aviso(); }
        document.querySelectorAll('[data-preferencias-cookies]').forEach(function (b) {
            b.addEventListener('click', function () { aviso(); });
        });
        // El botón flotante de WhatsApp se aparta mientras se ve el formulario de contacto, para no tapar los campos.
        var formulario = document.getElementById('contact-form');
        if (formulario && 'IntersectionObserver' in window) {
            new IntersectionObserver(function (e) {
                document.body.classList.toggle('en-contacto', e[0].isIntersecting);
            }, { threshold: 0.15 }).observe(formulario);
        }
    });
})();
