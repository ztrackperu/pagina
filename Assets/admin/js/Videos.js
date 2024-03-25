let tblVideos;

function alertas(msg, icono) {
    Swal.fire({
        position: 'top-end',
        icon: icono,
        title: msg,
        showConfirmButton: false,
        timer: 3000
    });
}



document.addEventListener("DOMContentLoaded", function () {

    tblVideos = $('#tblVideos').DataTable({
        ajax: {
            url: base_url + "Videos/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
          
             { 'data': 'imagen' },
            { 'data': 'estado' },
            { 'data': 'acciones' }
        ],
        responsive: true, 
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.0/i18n/es-ES.json',
        },
       

    });

});


function frmVideos() {
    document.getElementById("title").textContent= "Nuevo Video";
    document.getElementById("btnAccion").textContent= "Registrar";
    document.getElementById("frmVideos").reset();
    document.getElementById("id").value = "";
     deleteImg();
    $("#nuevoVideos").modal("show");
}


function registrarVideos(e) {
    e.preventDefault();
    const titulo = document.getElementById("video");
    if (titulo.value == "") {
        alertas('El Video es requerido', 'warning');
    } else {
        const url = base_url + "Videos/registrar";
        const frm = document.getElementById("frmVideos");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoVideos").modal("hide");
                frm.reset();
                tblVideos.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function btnEditarVideos(id) {
    document.getElementById("title").textContent = "Actualizar Videos";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "Videos/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("video_actual").value = res.videos;
            document.getElementById("video-preview").src = base_url + 'Assets/principal/img/videos/' + res.videos;
            document.getElementById("icon-video").classList.add("d-none");
            document.getElementById("icon-cerrar").innerHTML = `
            <button class="btn btn-danger" onclick="deleteImg()">
            <i class="ti ti-trash"></i></button>`;
            $("#nuevoVideos").modal("show");
        }
    }
}

function btnEliminarVideos(id) {
    Swal.fire({
        title: 'Esta seguro de eliminar?',
        text: "El Video no se eliminará de forma permanente, solo cambiará el estado a inactivo!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Videos/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblVideos.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function btnReingresarVideos(id) {
    Swal.fire({
        title: 'Esta seguro de reingresar?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Videos/reingresar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblVideos.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function preview(event) {
    var input = document.getElementById('video');
    var filePath = input.value;
    var extension = /(\.mp4|\.mov|\.avi|\.mkv)$/i; // Extensiones de video permitidas
    if (!extension.exec(filePath)) {
        alert('Seleccione un archivo válido (mp4, mov, avi, mkv)'); // Mostrar alerta estándar
        deleteVideo(); // Función para eliminar la previsualización del video
        return false;
    } else {
        const video = event.target.files[0];
        const videoUrl = URL.createObjectURL(video);
        const videoPreview = document.getElementById("video-preview");
        videoPreview.src = videoUrl;
        videoPreview.classList.remove("d-none"); // Muestra el elemento de video

        document.getElementById("icon-video").classList.add("d-none");
        document.getElementById("icon-cerrar").innerHTML = `
            <button class="btn btn-danger" onclick="deleteVideo()"><i class="ti ti-trash"></i></button>
        `;
    }
}

 function deleteImg() {
     document.getElementById("icon-cerrar").innerHTML ='';
     document.getElementById("icon-video").classList.remove("d-none");
     document.getElementById("video-preview").src = '';
     document.getElementById("video").value = '';
     document.getElementById("video_actual").value = '';
 }