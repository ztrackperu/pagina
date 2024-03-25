let tblInformacion;

function alertas(msg, icono) {
    Swal.fire({
        position: 'top-end',
        icon: icono,
        title: msg,
        showConfirmButton: false,
        timer: 3000
    });
}

document.addEventListener("DOMContentLoaded", function(){

    const  buttons= [
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

    tblInformacion = $('#tblInformacion').DataTable({
        ajax: {
            url: base_url + "Informacion/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'titulo' },
            { 'data': 'descripcion' },
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


function registrarInformacion(e) {
    e.preventDefault();
    const nombre_receta = document.getElementById("titulo");
    if (nombre_receta.value == "") {
        alertas('El Nombre de la Informacion es requerida', 'warning');
    } else {
        const url = base_url + "Informacion/registrar";
        const frm = document.getElementById("frmInformacion");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoInformacion").modal("hide");
                frm.reset();
                tblInformacion.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function btnEditarInformacion(id) {
    document.getElementById("title").textContent = "Actualizar Informacion";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "Informacion/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("titulo").value = res.titulo;
            document.getElementById("descripcion").value = res.descripcion;

            $("#nuevoInformacion").modal("show");
        }
    }
}



function frmInformacion() {
    document.getElementById("title").textContent = "Nueva Informacion";
    document.getElementById("btnAccion").textContent = "Registrar";
    document.getElementById("frmInformacion").reset();
    document.getElementById("id").value = "";
    $("#nuevoInformacion").modal("show");
}



