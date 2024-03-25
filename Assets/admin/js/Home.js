function alertas(msg, icono) {
    Swal.fire({
        position: 'top-end',
        icon: icono,
        title: msg,
        showConfirmButton: false,
        timer: 3000
    })
}
// FUNCION PARA EL MODAL


function registrarFormulario(e) {
    e.preventDefault();
    const nombre_cliente = document.getElementById("nombre_cliente");
    const email_cliente = document.getElementById("email_cliente");
    const asunto_formulario = document.getElementById("asunto_formulario");
    const mensaje = document.getElementById("mensaje");
    if (nombre_cliente.value == "" || email_cliente.value == "" || asunto_formulario.value == "" || mensaje.value == "") {
        alertas('Todos los campos son requeridos', 'warning');
    } else {
        const url = base_url + "Home/enviarFormulario";
        const frm = document.getElementById("frmFormulario");

        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // console.log("valido");
                const res = JSON.parse(this.responseText);
                //console.log(res);
                //$("#nuevoReceta").modal("hide");
                frm.reset();
                //tblRecetas.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function mostrarInformacion(e) {
    e.preventDefault();

    // Realizar una solicitud AJAX al servidor para obtener los datos
    const url = base_url + "Informacion/listar"; // Reemplaza "obtenerDatos" con el nombre de tu método en el controlador que devuelve los datos
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const datos = JSON.parse(this.responseText);
            // console.log(datos);
        }
    };
    http.send();
}



$(document).ready(function () {
    $('#myModal').on('shown.bs.modal', function () {
        // Elimina la clase para mostrar el modal antes de aplicar cualquier efecto
        $(this).removeClass('hide-initially');

        // Aplica un efecto de desvanecimiento al modal
        $(this).find('.modal-content').css('opacity', 0).animate({ opacity: 1 }, 2500);

        // Aplica un efecto de aumento de tamaño al modal
        $(this).find('.modal-content').css('transform', 'scale(0.8)').animate({ transform: 'scale(1)' }, 1000);
    });

    $('#myModal').modal('show'); // Muestra el modal
});


//LADING PAGE


 function mostrarModal() {
     const url = base_url + "LadingPage/listarladingModal";
     const http = new XMLHttpRequest();
     http.open("GET", url, true);
     http.onreadystatechange = function () {
         if (this.readyState == 4) {
             if (this.status == 200) {
                 const datos = JSON.parse(this.responseText);
                 console.log(datos);
                 actualizarModel(datos);
                 actualizarModelbody(datos);
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


/////////NABVAR CON PROMESA//////

function mostrarNabvar() {
    const url = base_url + "LadingPage/listarladingNabvar";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);
                actualizarMenu(datos);
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

function actualizarMenu(datos) {
    return new Promise((resolve, reject) => {


        // Selecciona el elemento del DOM con el ID "navbar" y lo asigna a la variable navbar
        const navbar = document.getElementById("navbar");
        // Selecciona el primer elemento <ul> dentro del elemento con ID "navbar" y lo asigna a la variable ul
        const ul = navbar.querySelector("ul");
        // Limpia cualquier contenido HTML dentro del elemento <ul>
        ul.innerHTML = ''; // Limpiamos el contenido actual del menú
        // Imprime los datos que se van a agregar al menú en la consola

        // Itera sobre cada elemento en el arreglo de datos
        datos.forEach(item => {
            // Crea un nuevo elemento <li>
            const li = document.createElement("li");
            // Crea un nuevo elemento <a>
            const a = document.createElement("a");
            // Agrega las clases "nav-link" y "scrollto" al elemento <a>
            a.classList.add("nav-link", "scrollto");
            // Establece el atributo href del elemento <a> con el valor de la propiedad "url" del elemento actual en datos
            a.href = `#${item.titulo}`; // Suponiendo que en los datos recibidos hay una propiedad 'url'
            // Establece el texto del elemento <a> con el valor de la propiedad "titulo" del elemento actual en datos
            a.textContent = item.titulo; // Suponiendo que en los datos recibidos hay una propiedad 'titulo'
            // Agrega el elemento <a> como hijo del elemento <li>
            li.appendChild(a);
            // Agrega el elemento <li> como hijo del elemento <ul>
            ul.appendChild(li);
        });
        resolve("Preguntas actualizadas correctamente");
        reject("se intento");


    });
}

mostrarNabvar();

///////SLIDER CON PROMESA////////

function mostrarSlider() {
    const url = base_url + "LadingPage/listarladingSlider";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);
                console.log(datos);
                actualizarSlider(datos);
                inicializarSwiper2();
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

function actualizarSlider(datos) {
    return new Promise((resolve, reject) => {
        const vidContainer = document.querySelector(".swiper-wrapper");
        vidContainer.innerHTML = '';

        datos.forEach((item, index) => {
            const swiperSlide = document.createElement("div");
            swiperSlide.classList.add("swiper-slide");

            const s1Container = document.createElement("div");
            s1Container.classList.add("s1");

            const imageElement = document.createElement("img");
            const urlImagen = base_url + "Assets/principal/img/banner/" + item.foto;
            imageElement.setAttribute("src", urlImagen);
            imageElement.setAttribute("alt", "");

            const textSlider = document.createElement("div");
            textSlider.classList.add("text-slider");

            const h1Element = document.createElement("h1");
            // Guardamos el texto del título en una variable para simular la escritura
            const titulo = item.titulo;
            // Inicializamos el contenido del h1 vacío
            h1Element.textContent = '';
            textSlider.appendChild(h1Element);

            s1Container.appendChild(imageElement);
            s1Container.appendChild(textSlider);
            swiperSlide.appendChild(s1Container);

            vidContainer.appendChild(swiperSlide);

            const paginationElement = document.createElement("div");
            paginationElement.classList.add("swiper-pagination");

            if (index === 0) {
                paginationElement.classList.add("swiper-pagination-bullet-active");
            }

            swiperSlide.appendChild(paginationElement);

            // Función para simular la escritura letra por letra
            function escribirTexto(elemento, texto, velocidadEscritura, indexCaracter) {
                if (indexCaracter < texto.length) {
                    elemento.textContent += texto.charAt(indexCaracter);
                    setTimeout(() => {
                        escribirTexto(elemento, texto, velocidadEscritura, indexCaracter + 1);
                    }, velocidadEscritura);
                }
            }

            // Llamamos a la función para iniciar la animación
            escribirTexto(h1Element, titulo, 100, 0);
            /*
            h1Elements.forEach((h1Element, index) => {
                const titulo = titulos[index];
                escribirTexto(h1Element, titulo, 100);
            });*/

        });

        resolve("Preguntas actualizadas correctamente");
    });
}

function inicializarSwiper2() {
    var swiper = new Swiper(".mySwiper", {
        centeredSlides: true,
        loop: true,
        effect: "fade",
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    // Añade estilo CSS para mantener visible el control de paginación
    var pagination = document.querySelector(".swiper-pagination");
    pagination.style.visibility = "visible";
}
mostrarSlider();


///////DESCRIPCION CON PROMESA////////


function mostrarDescripcion() {
    const url = base_url + "LadingPage/listarladingDescripcion";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);
                actualizarDescripcion(datos);
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

function actualizarDescripcion(datos) {

    return new Promise((resolve, reject) => {
        // Selecciona el elemento del DOM con el ID "descripcion" y lo asigna a la variable descripcion
        const descripcion = document.getElementById("descripcion");

        // Vacía cualquier contenido HTML dentro del elemento con el ID "descripcion"
        descripcion.innerHTML = '';

        // Itera sobre cada elemento en el arreglo de datos
        datos.forEach(item => {
            // Crea un nuevo elemento <div> para el título
            const tituloElement = document.createElement("div");
            tituloElement.classList.add("section-title-Principal", "titulo");
            // Crea un nuevo elemento <h2> para el título
            const h2Titulo = document.createElement("h2");
            h2Titulo.style.color = "#fff";
            // Agrega el contenido HTML para el título
            h2Titulo.innerHTML = `¿QUE ES <span style="color: #37517e;">${item.titulo}</span><span style="color:#fff;">?</span>`;
            // Agrega el elemento <h2> al elemento <div> del título
            tituloElement.appendChild(h2Titulo);

            // Crea un nuevo elemento <div> para la descripción
            const descripcionElement = document.createElement("div");
            descripcionElement.classList.add("section-descripcion");
            // Crea un nuevo elemento <p> para la descripción
            const pDescripcion = document.createElement("p");
            // Establece el texto de la descripción
            pDescripcion.textContent = item.descripcion;
            // Agrega el elemento <p> al elemento <div> de la descripción
            descripcionElement.appendChild(pDescripcion);

            // Agrega los elementos del título y descripción al elemento con el ID "descripcion"
            descripcion.appendChild(tituloElement);
            descripcion.appendChild(descripcionElement);
        });

        resolve("Preguntas actualizadas correctamente");
        reject("se intento");

    });
}

mostrarDescripcion();

///////FUNCIONES CON PROMESAS OK/////////

function mostrarFuncionesMonitoreo() {

    const url = base_url + "LadingPage/listarladingMonitoreo";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);

                actualizarFuncionesMonitoreo(datos);
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

function mostrarFuncionesControl() {
    const url = base_url + "LadingPage/listarladingControl";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);

                actualizarFuncionesControl(datos);
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

function actualizarFuncionesMonitoreo(datos) {

    return new Promise((resolve, reject) => {
        const descFunciones = document.getElementById("monitoreo");

        // Vacía cualquier contenido dentro del contenedor de funciones
        descFunciones.innerHTML = '';

        // Itera sobre cada elemento en el arreglo de datos
        datos.forEach(item => {
            // Crea un nuevo elemento div para contener cada par de imagen y texto
            const divContainer = document.createElement("div");
            divContainer.classList.add("contenido", "d-flex", "align-items-center");

            // Crea un elemento div para la primera columna
            const divCol1 = document.createElement("div");
            divCol1.classList.add("col");

            // Crea un elemento img para la imagen
            const img = document.createElement("img");
            const urlImagen = base_url + "Assets/principal/img/Funciones/" + item.foto;
            img.setAttribute("src", urlImagen);
            img.setAttribute("width", "50px");

            // Agrega la imagen al div de la primera columna
            divCol1.appendChild(img);

            // Crea un elemento div para la segunda columna
            const divCol2 = document.createElement("div");
            divCol2.classList.add("col");

            // Crea un elemento p para el texto
            const p = document.createElement("p");
            p.textContent = item.funciones;

            // Agrega el texto al div de la segunda columna
            divCol2.appendChild(p);

            // Agrega las columnas al contenedor
            divContainer.appendChild(divCol1);
            divContainer.appendChild(divCol2);

            // Agrega el contenedor al contenedor de funciones
            descFunciones.appendChild(divContainer);
        });
        resolve("Funciones actualizadas correctamente");
        reject("se intento");
    });
}

function actualizarFuncionesControl(datos) {

    return new Promise((resolve, reject) => {

        const descFunciones = document.getElementById("control");

        // Vacía cualquier contenido dentro del contenedor de funciones
        descFunciones.innerHTML = '';

        // Itera sobre cada elemento en el arreglo de datos
        datos.forEach(item => {
            // Crea un nuevo elemento div para contener cada par de imagen y texto
            const divContainer = document.createElement("div");
            divContainer.classList.add("contenido", "d-flex", "align-items-center");

            // Crea un elemento div para la primera columna
            const divCol1 = document.createElement("div");
            divCol1.classList.add("col");

            // Crea un elemento img para la imagen
            const img = document.createElement("img");
            const urlImagen = base_url + "Assets/principal/img/Funciones/" + item.foto;
            img.setAttribute("src", urlImagen);
            img.setAttribute("width", "50px");

            // Agrega la imagen al div de la primera columna
            divCol1.appendChild(img);

            // Crea un elemento div para la segunda columna
            const divCol2 = document.createElement("div");
            divCol2.classList.add("col");

            // Crea un elemento p para el texto
            const p = document.createElement("p");
            p.textContent = item.funciones;

            // Agrega el texto al div de la segunda columna
            divCol2.appendChild(p);

            // Agrega las columnas al contenedor
            divContainer.appendChild(divCol1);
            divContainer.appendChild(divCol2);

            // Agrega el contenedor al contenedor de funciones
            descFunciones.appendChild(divContainer);
        });
        resolve("Preguntas actualizadas correctamente");
        reject("se intento");
    });
}

mostrarFuncionesMonitoreo();
mostrarFuncionesControl();

///////BENEFICIOS COM PROMESAS OK/////////

function mostrarBeneficios() {
    const url = base_url + "LadingPage/listarladingBeneficios";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);
                actualizarBeneficios(datos);
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

function actualizarBeneficios(datos) {

    return new Promise((resolve, reject) => {

        const gridContent = document.querySelector(".grid-content");
        gridContent.innerHTML = '';
        datos.forEach(item => {
            const gridElement = document.createElement("div");
            gridElement.classList.add("grid-element");

            const imgBeneficio = document.createElement("div");
            imgBeneficio.classList.add("img-beneficio");

            const img = document.createElement("img");
            const urlImagen = base_url + "Assets/principal/img/Beneficios/" + item.foto;
            img.setAttribute("src", urlImagen);
            img.setAttribute("alt", "");

            imgBeneficio.appendChild(img);

            const textBeneficio = document.createElement("div");
            textBeneficio.classList.add("text-beneficio");

            const h1 = document.createElement("h1");
            h1.textContent = item.titulo;

            const p = document.createElement("p");
            p.textContent = item.descripcion;

            textBeneficio.appendChild(h1);
            textBeneficio.appendChild(p);

            gridElement.appendChild(imgBeneficio);
            gridElement.appendChild(textBeneficio);

            gridContent.appendChild(gridElement);
        });
        resolve("Beneficios mostrados correctamente");
        reject("se intento");
    });
}

mostrarBeneficios();


///////BENEFICIOS COM PROMESAS OK/////////

function mostrarCaracteristicas() {
    const url = base_url + "LadingPage/listarladingCaracteristicas";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);
                actualizarCaracteristicas(datos);
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

function actualizarCaracteristicas(datos) {

    return new Promise((resolve, reject) => {
        // Selecciona el contenedor de las tarjetas con la clase "content_card"
        const contentCard = document.querySelector(".content_card");
        // Limpia cualquier contenido HTML dentro del contenedor de tarjetas
        contentCard.innerHTML = ''; // Limpiamos el contenido actual del menú
        // Imprime los datos que se van a agregar en la consola


        //ruta para la ubicacion de las fotos
        

        // Itera sobre cada elemento en el arreglo de datos
        datos.forEach(item => {
            // Crea un nuevo elemento de tarjeta (<div> con clase "card_element")
            const cardElement = document.createElement("div");
            cardElement.classList.add("card_element");

            // Crea un nuevo elemento para el frente de la tarjeta (<div> con clase "front-card")
            const frontCard = document.createElement("div");
            frontCard.classList.add("front-card");

            // Crea un elemento de imagen
            const img = document.createElement("img");
            const urlImagen = base_url + "Assets/principal/img/Caracteristicas/" + item.foto;
            img.setAttribute("src", urlImagen); // Asigna la URL de la imagen desde los datos
            img.setAttribute("alt", ""); // Puedes asignar un texto alternativo si lo deseas

            // Crea un elemento de título
            const h1 = document.createElement("h1");
            
            
            h1.textContent = item.titulo; // Asigna el título desde los datos
            
            // Agrega la imagen y el título al frente de la tarjeta
            frontCard.appendChild(img);
            frontCard.appendChild(h1);
            
            // Crea un nuevo elemento para el reverso de la tarjeta (<div> con clase "back-card")
            const backCard = document.createElement("div");
            backCard.classList.add("back-card");

            // Crea un elemento de párrafo
            const p = document.createElement("p");
            p.textContent = item.descripcion; // Asigna la descripción desde los datos

            // Agrega el párrafo al reverso de la tarjeta
            backCard.appendChild(p);

            // Agrega el frente y el reverso de la tarjeta al elemento de tarjeta
            cardElement.appendChild(frontCard);
            cardElement.appendChild(backCard);

            // Agrega la tarjeta al contenedor de tarjetas
            contentCard.appendChild(cardElement);
        });
        resolve("Preguntas actualizadas correctamente");
        reject("se intento");
    });
}

mostrarCaracteristicas();


///VIDEOS CON PROMESAS OK////

function mostrarVideos() {
    const url = base_url + "LadingPage/listarladingVideos";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                const datos = JSON.parse(this.responseText);
                actualizarVideos(datos);
                inicializarSwiper();
            } else {
                console.error("Error al obtener datos:", this.status);
            }
        }
    };
    http.onerror = function () {
        console.error("Error de red al realizar la solicitud.");
    };
    http.send();
}

function actualizarVideos(datos) {

    return new Promise((resolve, reject) => {

        const vidContainer = document.querySelector("#vid-container .swiper-wrapper");
        vidContainer.innerHTML = '';

        datos.forEach(item => {
            const swiperSlide = document.createElement("div");
            swiperSlide.classList.add("swiper-slide");

            const videoElement = document.createElement("video");
            videoElement.setAttribute("width", "100%");
            videoElement.setAttribute("height", "100%");
            videoElement.setAttribute("controls", "");

            const sourceElement = document.createElement("source");
            const urlVideo = base_url + "Assets/principal/img/videos/" + item.videos;
            sourceElement.setAttribute("src", urlVideo);
            sourceElement.setAttribute("type", "video/mp4");

            videoElement.appendChild(sourceElement);
            swiperSlide.appendChild(videoElement);

            vidContainer.appendChild(swiperSlide);
        });
        resolve("Preguntas actualizadas correctamente");
        reject("se intento");
    });
}

function inicializarSwiper() {
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        loop: true,
        effect: 'coverflow',
        centeredSlides: true,
        slidesPerView: 'auto',
        coverflowEffect: {
            rotate: 20,
            stretch: 0,
            depth: 500, // Reducir el valor de depth
            modifier: 1,
            slideShadows: false, // Desactivar las sombras de las diapositivas
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        // Desactivar el efecto de autogiro
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
        speed: 1000,
    });
}

mostrarVideos();


///PREGUNTAS CON PROMESAS OK////

function mostrarPreguntas() {
    const url = base_url + "LadingPage/listarladingPreguntas";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.onreadystatechange = function () {
        if (this.readyState == 4) {
            if (this.status == 200) {
                // Verificamos si la respuesta es un JSON válido
             
                    const datos = JSON.parse(this.responseText);
                    // Llamamos a la función para actualizar las preguntas con los datos obtenidos
                    actualizarPreguntas(datos);
                    console.log(actualizarPreguntas);
                    // Maneja el error como desees, por ejemplo, mostrando un mensaje al usuario.
               
            } 
        }
    };
    http.onerror = function () {
        console.error("Error de red al realizar la solicitud.");
        // Maneja el error de red si lo deseas.
    };
    http.send();
}


function actualizarPreguntas(datos) {
    // Creamos una nueva promesa que envolverá nuestra operación asíncrona
    return new Promise((resolve, reject) => {
        // Obtenemos la referencia al elemento donde queremos agregar las preguntas
        const preguntas = document.getElementById("preguntas");
        // Obtenemos la lista dentro del elemento de preguntas
        const ul = preguntas.querySelector("ul");
        // Limpiamos cualquier contenido existente en la lista de preguntas
        ul.innerHTML = ''; // Limpiamos el contenido actual del menú

        // Iteramos sobre cada pregunta en el array de datos recibido
        datos.forEach(item => {
            // Creamos un nuevo elemento de lista para la pregunta
            const li = document.createElement("li");
            // Añadimos atributos de animación usando AOS (Animate on Scroll)
            li.setAttribute("data-aos", "fade-up");
            li.setAttribute("data-aos-delay", "100");

            // Creamos un icono para representar la pregunta
            const i = document.createElement("i");
            i.classList.add("bx", "bx-help-circle", "icon-help");

            // Creamos un elemento <a> para actuar como botón de despliegue/plegado de la respuesta
            const a = document.createElement("a");
            a.setAttribute("data-bs-toggle", "collapse");
            a.classList.add("collapse");
            // Establecemos el atributo data-bs-target para que apunte al ID de la respuesta correspondiente
            a.setAttribute("data-bs-target", `#faq-list-${datos.indexOf(item) + 1}`);

            // Creamos íconos para mostrar y ocultar la respuesta
            const iconShow = document.createElement("i");
            iconShow.classList.add("bx", "bx-chevron-down", "icon-show");
            const iconClose = document.createElement("i");
            iconClose.classList.add("bx", "bx-chevron-up", "icon-close");

            // Añadimos los íconos al elemento <a>
            a.appendChild(iconShow);
            a.appendChild(iconClose);

            // Creamos un elemento <span> para mostrar el texto de la pregunta
            const preguntaSpan = document.createElement("span");
            preguntaSpan.textContent = item.pregunta;
            // Añadimos el texto de la pregunta al elemento <a>
            a.appendChild(preguntaSpan);

            // Creamos un elemento <div> para la respuesta, establecemos su ID y clases
            const div = document.createElement("div");
            div.id = `faq-list-${datos.indexOf(item) + 1}`;
            div.classList.add("collapse", "show");
            // Establecemos el atributo data-bs-parent para que funcione con el sistema de colapsado de Bootstrap
            div.setAttribute("data-bs-parent", ".faq-list");

            // Creamos un elemento <p> para mostrar el texto de la respuesta
            const p = document.createElement("p");
            p.textContent = item.respuesta;

            // Añadimos el texto de la respuesta al elemento <div>
            div.appendChild(p);

            // Añadimos los elementos creados al elemento de lista <li>
            li.appendChild(i); // Icono de pregunta
            li.appendChild(a); // Botón de despliegue/plegado
            li.appendChild(div); // Respuesta

            // Añadimos el elemento de lista <li> a la lista <ul>
            ul.appendChild(li);
        });

        // Una vez que hemos completado todas las operaciones, resolvemos la promesa
        // con un mensaje indicando que las preguntas han sido actualizadas correctamente
        resolve("Preguntas actualizadas correctamente");
        reject("se intento");
    });
}

mostrarPreguntas();



