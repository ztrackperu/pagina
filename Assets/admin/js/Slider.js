let tblSlider;

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

    

    tblSlider = $('#tblSlider').DataTable({
        ajax: {
            url: base_url + "Slider/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'titulo' },
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


function frmSlider() {
    document.getElementById("title").textContent= "Nuevo Slider";
    document.getElementById("btnAccion").textContent= "Registrar";
    document.getElementById("frmSlider").reset();
    document.getElementById("id").value = "";
     deleteImg();
    $("#nuevoSlider").modal("show");
}


function registrarSlider(e) {
    e.preventDefault();
  
        const url = base_url + "Slider/registrar";
        const frm = document.getElementById("frmSlider");
        const http = new XMLHttpRequest();
        http.open("POST", url, true);
        http.send(new FormData(frm));
        http.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                const res = JSON.parse(this.responseText);
                $("#nuevoSlider").modal("hide");
                frm.reset();
                 tblSlider.ajax.reload();
                alertas(res.msg, res.icono);
            }
        }
    
}

function btnEditarSlider(id) {
    document.getElementById("title").textContent = "Actualizar Slider";
    document.getElementById("btnAccion").textContent = "Modificar";
    const url = base_url + "Slider/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("titulo").value = res.titulo;
            document.getElementById("foto_actual").value = res.foto;
            document.getElementById("img-preview").src = base_url + 'Assets/principal/img/Banner/' + res.foto;
            document.getElementById("icon-image").classList.add("d-none");
            document.getElementById("icon-cerrar").innerHTML = `
            <button class="btn btn-danger" onclick="deleteImg()">
            <i class="ti ti-trash"></i></button>`;
            $("#nuevoSlider").modal("show");
        }
    }
}

function btnEliminarSlider(id) {
    Swal.fire({
        title: 'Esta seguro de eliminar?',
        text: "El Beneficio no se eliminará de forma permanente, solo cambiará el estado a inactivo!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si!',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            const url = base_url + "Slider/eliminar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblSlider.ajax.reload();
                    alertas(res.msg, res.icono);
                }
            }

        }
    })
}

function btnReingresarSlider(id) {
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
            const url = base_url + "Slider/reingresar/" + id;
            const http = new XMLHttpRequest();
            http.open("GET", url, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    tblSlider.ajax.reload();
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