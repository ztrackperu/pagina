let tblModalEmergente;

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

    const buttons = [
        {
            extend: 'excel',
            text: '<i class="ti ti-file-spreadsheet"></i>',
            className: 'btn btn-success',
            titleAttr: 'Exportar a Excel'
        },
        {
            extend: 'pdf',
            text: '<i class="ti ti-file-text"></i>',
            className: 'btn btn-danger',
            titleAttr: 'Exportar a PDF'
        },
        {
            extend: 'print',
            text: '<i class="ti ti-printer"></i>',
            className: 'btn btn-info',
            titleAttr: 'Imprimir'
        }
    ];

    tblModalEmergente = $('#tblModalEmergente').DataTable({
        ajax: {
            url: base_url + "ModalEmergente/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'titulo' },
            { 'data': 'subtitulo' },
            { 'data': 'descripcion' },
            { 'data': 'imagen' },
            { 'data': 'estado' },
            { 'data': 'acciones' }
        ],
        responsive: true, 
        language: {
            url: '//cdn.datatables.net/plug-ins/2.0.0/i18n/es-ES.json',
        },

        dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-5'i><'col-sm-7'p>>",
        buttons
    });

});


function frmModalEmergente() {
    document.getElementById("title").textContent= "Nuevo Popup";
    document.getElementById("btnAccion").textContent= "Registrar";
    document.getElementById("frmModalEmergente").reset();
    document.getElementById("id").value = "";
     deleteImg();
    $("#nuevoModalEmergente").modal("show");
}


function registrarModalEmergente(e) {
    e.preventDefault();
    const titulo = document.getElementById("titulo");
    if (titulo.value == "") {
        alertas('El titulo es requerido', 'warning');
    } else {
        const url = base_url + "ModalEmergente/registrar";
        const frm = document.getElementById("frmModalEmergente");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoModalEmergente").modal("hide");
                frm.reset();
                tblModalEmergente.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function btnEditarModalEmergente(id) {
    document.getElementById("title").textContent = "Actualizar Modal";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "ModalEmergente/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("titulo").value = res.titulo;
            document.getElementById("subtitulo").value = res.subtitulo;
            document.getElementById("descripcion").value = res.descripcion;
            document.getElementById("foto_actual").value = res.foto;
            document.getElementById("img-preview").src = base_url + 'Assets/principal/img/Modal/' + res.foto;
            document.getElementById("icon-image").classList.add("d-none");
            document.getElementById("icon-cerrar").innerHTML = `
            <button class="btn btn-danger" onclick="deleteImg()">
            <i class="ti ti-trash"></i></button>`;
            $("#nuevoModalEmergente").modal("show");
        }
    }
}

function btnEliminarModalEmergente(id) {
    Swal.fire({
        title: 'Esta seguro de eliminar?',
        text: "El Modal no se eliminará de forma permanente, solo cambiará el estado a inactivo!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "ModalEmergente/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblModalEmergente.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function btnReingresarModalEmergente(id) {
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
            const url = base_url + "ModalEmergente/reingresar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblModalEmergente.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function preview(e) {
    var input = document.getElementById('imagen');
    var filePath = input.value;
    var extension = /(\.png|\.jpeg|\.jpg)$/i;
    if (!extension.exec(filePath)) {
        alertas('Seleccione un archivo valido', 'warning');
        deleteImg();
        return false;
    }else{
        const url = e.target.files[0];
        const urlTmp = URL.createObjectURL(url);
        document.getElementById("img-preview").src = urlTmp;
        document.getElementById("icon-image").classList.add("d-none");
        document.getElementById("icon-cerrar").innerHTML = `
        <button class="btn btn-danger" onclick="deleteImg()"><i class="ti ti-trash"></i></button>
        `;
    }

}

 function deleteImg() {
     document.getElementById("icon-cerrar").innerHTML ='';
     document.getElementById("icon-image").classList.remove("d-none");
     document.getElementById("img-preview").src = '';
     document.getElementById("imagen").value = '';
     document.getElementById("foto_actual").value = '';
 }