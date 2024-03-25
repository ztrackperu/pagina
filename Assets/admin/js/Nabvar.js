let tblNabvar;

function alertas(msg, icono) {
    Swal.fire({
        position: 'top-end',
        icon: icono,
        title: msg,
        showConfirmButton: false,
        timer: 3000
    });
}

$(document).ready(function () {
    $('.js-example-basic-single').select2();
});

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

    tblNabvar = $('#tblNabvar').DataTable({
        ajax: {
            url: base_url + "Nabvar/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'titulo' },
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


function frmNabvar() {
    document.getElementById("title").textContent= "Nuevo Nabvar";
    document.getElementById("btnAccion").textContent= "Registrar";
    document.getElementById("frmNabvar").reset();
    document.getElementById("id").value = "";
    $("#nuevoNabvar").modal("show");
}


function registrarNabvar(e) {
    e.preventDefault();
    const titulo = document.getElementById("titulo");
    if (titulo.value == "") {
        alertas('El Nabvar es requerido', 'warning');
    } else {
        const url = base_url + "Nabvar/registrar";
        const frm = document.getElementById("frmNabvar");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoNabvar").modal("hide");
                frm.reset();
                tblNabvar.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function btnEditarNabvar(id) {
    document.getElementById("title").textContent = "Actualizar Nabvar";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "Nabvar/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("titulo").value = res.titulo;
            $("#nuevoNabvar").modal("show");
        }
    }
}

function btnEliminarNabvar(id) {
    Swal.fire({
        title: 'Esta seguro de eliminar?',
        text: "El Texto no se eliminará de forma permanente, solo cambiará el estado a inactivo!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Nabvar/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblNabvar.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function btnReingresarNabvar(id) {
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
            const url = base_url + "Nabvar/reingresar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblNabvar.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

