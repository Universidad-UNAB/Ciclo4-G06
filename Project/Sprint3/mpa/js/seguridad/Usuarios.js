
function findAllPerson() {
    $.ajax({
        url: 'http://localhost:9000/api/security/person',
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (items) {
        var registros = `<option value="">--Seleccione--</option>`;
        items.forEach(function (item, index, array) {
            registros+=`<option value="`+item.id+`">`+item.nombreCompleto+`</option>`;
        })
        $("#personaId").html(registros);
        dataClear();
    })
}

function findAll() {
    $.ajax({
        url: 'http://localhost:9000/api/security/user',
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (items) {
        var registros = "";
        items.forEach(function (item, index, array) {
            registros+=`<tr class="table-light">
                            <td>`+item.usuario+`</td>
                            <td>`+item.personaId.nombreCompleto+`</td>
                            <td>`+item.rolId.nombre+`</td>                           
                            <td>`+(item.estado==true?'Activo':'Inactivo')+`</td>
                            <td><img src="../../asset/libreria/node_modules/bootstrap-icons/icons/pen-fill.svg" alt="" onclick="findById('`+item.id+`');"></td>
                            <td><img src="../../asset/libreria/node_modules/bootstrap-icons/icons/trash2-fill.svg" alt="" onclick="deleteById('`+item.id+`')"></td>
                        </tr>`;
        })
        $("#dataResult").html(registros);
        dataClear();
    })
}