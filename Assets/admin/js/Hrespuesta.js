let tblHrespuesta;


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

    tblHrespuesta = $('#tblHrespuesta').DataTable({
        ajax: {
            url: base_url + "Hrespuesta/listar",
            dataSrc: ''
        },
        columns: [
            { 'data': 'id' },
            { 'data': 'asunto_formulario' },
            { 'data': 'mensaje' },
            { 'data': 'nombre' },
            { 'data': 'fecha' },
            { 'data': 'evento' }
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