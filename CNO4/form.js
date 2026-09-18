(function () {
  emailjs.init("AZzft7hIe03mKZBGN"); // Clave pública
})();

document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("contactForm");

  if (form) {
    form.addEventListener("submit", function (e) {
      e.preventDefault();

      // Captura los valores directo de los inputs por su ID o name
      const data = {
        name: document.getElementById("name") ? document.getElementById("name").value : this.name.value,
        correo: document.getElementById("email") ? document.getElementById("email").value : this.correo.value,
        mensaje: document.getElementById("message") ? document.getElementById("message").value : this.mensaje.value
      };

      emailjs
        .send("service_rds9pev", "template_jzzipln", data)
        .then(() => {
          const params = new URLSearchParams(data).toString();
          window.location.href = "confirmacion.html?" + params;
        })
        .catch((err) => {
          alert("❌ Error al enviar: " + JSON.stringify(err));
        });
    });
  }
});
