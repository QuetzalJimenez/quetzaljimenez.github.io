// form.js
(function(){
  emailjs.init("AZzft7hIe03mKZBGN"); // Reemplaza con tu public key
})();

document.getElementById("contactForm").addEventListener("submit", function(e){
  e.preventDefault();

  const data = {
    name: this.name.value,
    correo: this.correo.value,
    mensaje: this.mensaje.value
  };

  emailjs.send("service_rds9pev","template_jzzipln",data)
    .then(() => {
      // Redirigir a página de confirmación
      const params = new URLSearchParams(data).toString();
      window.location.href = "confirmacion.html?" + params;
    })
    .catch(err => alert("Error al enviar: " + JSON.stringify(err)));
});
