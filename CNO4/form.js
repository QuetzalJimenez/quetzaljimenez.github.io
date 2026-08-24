// form.js
(function(){
  emailjs.init("TU_PUBLIC_KEY"); // Reemplaza con tu public key
})();

document.getElementById("contactForm").addEventListener("submit", function(e){
  e.preventDefault();

  const data = {
    nombre: this.nombre.value,
    correo: this.correo.value,
    mensaje: this.mensaje.value
  };

  emailjs.send("TU_SERVICE_ID","TU_TEMPLATE_ID",data)
    .then(() => {
      // Redirigir a página de confirmación
      const params = new URLSearchParams(data).toString();
      window.location.href = "confirmacion.html?" + params;
    })
    .catch(err => alert("Error al enviar: " + JSON.stringify(err)));
});
