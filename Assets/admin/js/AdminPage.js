if (document.getElementById("reportePrestamo2")) {
    const url = base_url + "AdminPage/mostrargrafico";
    const http = new XMLHttpRequest();
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
                const data = JSON.parse(this.responseText);
                let enviados = [];
                let respuesto = [];
                for (let i = 0; i < data.length; i++) {
                    enviados.push(data[i]['estado']);
                    respuesto.push(data[i]['estado']);
                }
                var ctx = document.getElementById("reportePrestamo2");
                var myPieChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: nombre,
                        datasets: [{
                            label: 'Preguntas',
                            data: cantidad,
                            backgroundColor: ['#dc143c'],
                        }],
                    },
                });
            
        }
    }
}