let tblFormulario;
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

    tblFormulario = $('#tblFormulario').DataTable({
        ajax: {
            url: base_url + "Formulario/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'nombre_cliente' },
            { 'data': 'asunto_formulario' },
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

function btnEditarFormulario(id) {
    document.getElementById("title").textContent = "Respuesta Formulario";
    document.getElementById("btnAccion").textContent = "Responder";
    const url = base_url + "Formulario/editar/" + id;
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            document.getElementById("id").value = res.id;
            document.getElementById("correo_usuario").value = res.correo_usuario;
            document.getElementById("clave_correo").value = res.clave_correo;
            document.getElementById("nombre_cliente").value = res.nombre_cliente;
            document.getElementById("telefono_cliente").value = res.telefono_cliente;
            document.getElementById("email_cliente").value = res.email_cliente;
            document.getElementById("asunto_formulario").value = res.asunto_formulario;    
            document.getElementById("mensaje").value = res.mensaje;  
            document.getElementById("id_2").value = res.id;        
                  
            $("#nuevoFormulario").modal("show");
        }
    }
}



  function registrarRespuesta(e) {
      e.preventDefault();
      const asunto_respuesta = document.getElementById("asunto_respuesta");
      if (asunto_respuesta.value == "") {
          alertas('El Nombre de la respuesta es requerido', 'warning');
      } else {
        
          const url = base_url + "Formulario/registrar";
          const frm = document.getElementById("frmRespuesta");
          const http = new XMLHttpRequest();
          http.open("POST", url, true);
          http.send(new FormData(frm));
          http.onreadystatechange = function () {
              if (this.readyState == 4 && this.status == 200) {
                  const res = JSON.parse(this.responseText);
                  $("#nuevoFormulario").modal("hide");
                  frm.reset();
                  tblFormulario.ajax.reload();
                  alertas(res.msg, res.icono);
              }
          }
      }
  }

