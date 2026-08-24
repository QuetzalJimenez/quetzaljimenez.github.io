(function(){
  emailjs.init("TU_PUBLIC_KEY"); // tu clave pública
})();

document.getElementById("contactForm").addEventListener("submit", function(e){
  e.preventDefault();

  const data = {
    name: this.name.value,
    correo: this.correo.value,
    mensaje: this.mensaje.value
  };

  emailjs.send("TU_SERVICE_ID","TU_TEMPLATE_ID",data)
    .then(() => {
      const params = new URLSearchParams(data).toString();
      window.location.href = "confirmacion.html?" + params;
    })
    .catch(err => {
      alert("❌ Error al enviar: " + JSON.stringify(err));
    });
});
