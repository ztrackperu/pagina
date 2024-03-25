let tblFuncionesA;

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

    tblFuncionesA = $('#tblFuncionesA').DataTable({
        ajax: {
            url: base_url + "FuncionesA/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'funciones' },
            { 'data': 'categoria' },
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


function frmFuncion() {
    document.getElementById("title").textContent= "Nueva Funcion";
    document.getElementById("btnAccion").textContent= "Registrar";
    document.getElementById("frmFuncion").reset();
    document.getElementById("id").value = "";
     deleteImg();
    $("#nuevoFuncion").modal("show");
}

function registrarFuncion(e) {
    e.preventDefault();
    const funcion = document.getElementById("funcion");
    if (funcion.value == "") {
        alertas('La Funcion es requerida', 'warning');
    } else {
        const url = base_url + "FuncionesA/registrar";
        const frm = document.getElementById("frmFuncion");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoFuncion").modal("hide");
                frm.reset();
                tblFuncionesA.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    }
}

function btnEditarFuncion(id) {
    document.getElementById("title").textContent = "Actualizar Funcion";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "FuncionesA/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("funcion").value = res.funciones;
            document.getElementById("categoria").value = res.categoria;
            document.getElementById("foto_actual").value = res.foto;
            document.getElementById("img-preview").src = base_url + 'Assets/principal/img/Funciones/' + res.foto;
            document.getElementById("icon-image").classList.add("d-none");
            document.getElementById("icon-cerrar").innerHTML = `
            <button class="btn btn-danger" onclick="deleteImg()">
            <i class="ti ti-trash"></i></button>`;
            $("#nuevoFuncion").modal("show");
        }
    }
}

function btnEliminarFuncion(id) {
    Swal.fire({
        title: 'Esta seguro de eliminar?',
        text: "La Funcion no se eliminará de forma permanente, solo cambiará el estado a inactivo!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "FuncionesA/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblFuncionesA.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function btnReingresarFuncion(id) {
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
            const url = base_url + "FuncionesA/reingresar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblFuncionesA.ajax.reload();
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