let tblPreguntas;
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

    tblPreguntas = $('#tblPreguntas').DataTable({
        ajax: {
            url: base_url + "Preguntas/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'pregunta' },
            { 'data': 'respuesta' },
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


function registrarPreguntas(e) {
    e.preventDefault();
    const Pregunta = document.getElementById("pregunta");
    if (Pregunta.value == "") {
        alertas('El Nombre de la Pregunta es requerida', 'warning');
    } else {
        const url = base_url + "Preguntas/registrar";
        const frm = document.getElementById("frmPreguntas");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoPreguntas").modal("hide");
                frm.reset();
                tblPreguntas.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function frmPreguntas() {
    document.getElementById("title").textContent = "Nueva Pregunta";
    document.getElementById("btnAccion").textContent = "Registrar";
    document.getElementById("frmPreguntas").reset();
    document.getElementById("id").value = "";
    $("#nuevoPreguntas").modal("show");
}

function btnEditarPreguntas(id) {
    document.getElementById("title").textContent = "Actualizar Preguntas";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "Preguntas/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("pregunta").value = res.pregunta;
            document.getElementById("respuesta").value = res.respuesta;          

            $("#nuevoPreguntas").modal("show");
        }
    }
}

function btnEliminarPreguntas(id) {
    Swal.fire({
        title: 'Esta seguro de eliminar?',
        text: "La Pregunta no se eliminará de forma permanente",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Preguntas/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblPreguntas.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function btnReingresarPreguntas(id) {
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
            const url = base_url + "Preguntas/reingresar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblPreguntas.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}
