(function(){
  emailjs.init("AZzft7hIe03mKZBGN"); // tu clave pública
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
      const params = new URLSearchParams(data).toString();
      window.location.href = "confirmacion.html?" + params;
    })
    .catch(err => {
      alert("❌ Error al enviar: " + JSON.stringify(err));
    });
});
