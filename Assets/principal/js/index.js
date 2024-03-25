function mostrarModal() {
  const url = base_url + "ModalEmergente/listarlading";
  const http = new XMLHttpRequest();
  http.open("GET", url, true);
  http.onreadystatechange = function () {
      if (this.readyState == 4) {
          if (this.status == 200) {
              const datos = JSON.parse(this.responseText);
              console.log(datos);
              actualizarModel(datos);
              actualizarModelbody(datos);
          } else {
              console.error("Error al obtener datos:", this.status);
              // Aquí puedes manejar el error de acuerdo a tus necesidades,
              // como mostrar un mensaje de error al usuario, intentar nuevamente la solicitud, etc.
          }
      }
  };
  http.onerror = function () {
      console.error("Error de red al realizar la solicitud.");
      // Aquí también puedes manejar el error de red si lo deseas.
  };
  http.send();
}

function actualizarModel(datos) {
   return new Promise((resolve, reject) => {

       const modalHeader = document.querySelector(".modal-header");
       modalHeader.innerHTML = '';
       datos.forEach(item => {
           const tituloDiv = document.createElement("div");
           tituloDiv.classList.add("text-title");

           const tituloH1 = document.createElement("h1");
           tituloH1.textContent = item.titulo;

           tituloDiv.appendChild(tituloH1);

           modalHeader.appendChild(tituloDiv);
       });

        //Agregar el botón de cerrar
       const closeButton = document.createElement("button");
       closeButton.setAttribute("type", "button");
       closeButton.classList.add("btn-close");
       closeButton.setAttribute("data-bs-dismiss", "modal");
       closeButton.setAttribute("aria-label", "Close");

       modalHeader.appendChild(closeButton);

       resolve("Beneficios mostrados correctamente");
   });
}

function actualizarModelbody(datos) {
   return new Promise((resolve, reject) => {

       const modalBody = document.querySelector(".modal-body");
       modalBody.innerHTML = '';
       datos.forEach(item => {
           const imagen = document.createElement("div");
           imagen.classList.add("imagen","oferta","text-informativo");

           const img = document.createElement("img");
           const urlImagen = base_url + "Assets/principal/img/Modal/" + item.foto;
           img.setAttribute("src", urlImagen);
           img.setAttribute("alt", "");
           img.style.width = "40%";

           const tituloH2 = document.createElement("h2");
           tituloH2.textContent = item.subtitulo;

           const informacion = document.createElement("div");
           informacion.classList.add("text-informativo");

           const descripcion = document.createElement("p");
           descripcion.textContent = item.descripcion;

           imagen.appendChild(img);
           imagen.appendChild(tituloH2);
           imagen.appendChild(descripcion);

           modalBody.appendChild(imagen);
       });

       resolve("Beneficios mostrados correctamente");
   });
}


mostrarModal();
