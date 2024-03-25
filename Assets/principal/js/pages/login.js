const frm = document.querySelector("#formulario");
document.addEventListener("DOMContentLoaded", function () {
    frm.addEventListener("submit", function (e) {

        e.preventDefault();

        if (frm.usuario.value == "" || frm.clave.value == "") {
            alertaSw("TODOS LOS CAMPOS SON REQUERIDOS", "warning")
        } else {
            const http = new XMLHttpRequest();
            const url = base_url + "login/validar";
            http.open("POST", url, true);
            http.send(new FormData(frm));
            http.onreadystatechange = function () {

                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                }

            }
        }

    })
})