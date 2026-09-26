  <!-- SCRIPTS -->
    // 1. Script para cambiar el origen del Visor (PDF / HTML)
    function cargarVista(url) {
      const iframe = document.getElementById('viewer-frame');
      if (iframe) {
        iframe.src = url;
      }
    }

    // 2. Script Menú Desplegable Proyectos
    (function () {
      const toggle = document.querySelector('.dropdown-toggle');
      const menu = document.getElementById('proyectos-list');
      
      if (toggle && menu) {
        document.addEventListener('click', function (e) {
          if (e.target === toggle) {
            const hidden = menu.hasAttribute('hidden');
            if (hidden) { 
              menu.removeAttribute('hidden'); 
              toggle.setAttribute('aria-expanded','true'); 
            } else { 
              menu.setAttribute('hidden',''); 
              toggle.setAttribute('aria-expanded','false'); 
            }
            return;
          }
          if (!toggle.contains(e.target) && !menu.contains(e.target)) {
            menu.setAttribute('hidden',''); 
            toggle.setAttribute('aria-expanded','false');
          }
        });

        document.addEventListener('keydown', function (e) {
          if (e.key === 'Escape') { 
            menu.setAttribute('hidden',''); 
            toggle.setAttribute('aria-expanded','false'); 
            toggle.focus(); 
          }
        });
      }
    })();

    // 3. Control de Modales de Evidencia
    function openLabModal(modalId) {
      const modal = document.getElementById(modalId);
      if (modal) {
        modal.setAttribute('aria-hidden', 'false');
        document.documentElement.style.overflow = 'hidden';
      }
    }

    function closeLabModal(modalId) {
      const modal = document.getElementById(modalId);
      if (modal) {
        modal.setAttribute('aria-hidden', 'true');
        document.documentElement.style.overflow = '';
      }
    }

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        const activeModals = document.querySelectorAll('.lab-modal[aria-hidden="false"]');
        activeModals.forEach(modal => {
          closeLabModal(modal.id);
        });
      }
    });
