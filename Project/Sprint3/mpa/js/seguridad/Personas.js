function findAll() {
    $.ajax({
        url: 'http://localhost:9000/api/security/person',
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (items) {
        var registros = "";
        items.forEach(function (item, index, array) {
            registros+=`<tr class="table-light">
                            <td>`+item.tipoDocumento+`</td>
                            <td>`+item.documento+`</td>
                            <td>`+item.nombreCompleto+`</td>
                            <td>`+item.correo+`</td>
                            <td>`+item.celular+`</td>
                            <td>`+item.direccion+`</td>
                            <td>`+(item.estado==true?'Activo':'Inactivo')+`</td>
                            <td><img src="../../asset/libreria/node_modules/bootstrap-icons/icons/pen-fill.svg" alt="" onclick="findById('`+item.id+`');"></td>
                            <td><img src="../../asset/libreria/node_modules/bootstrap-icons/icons/trash2-fill.svg" alt="" onclick="deleteById('`+item.id+`')"></td>
                        </tr>`;
        })
        $("#dataResult").html(registros);
        dataClear();
    })
}

function findById(id) {
    $.ajax({
        url: 'http://localhost:9000/api/security/person/'+id,
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (item) {
        $("#id").val(item.id)        
        $("#tipoDocumento").val(item.tipoDocumento)
        $("#documento").val(item.documento)
        $("#nombreCompleto").val(item.nombreCompleto)
        $("#correo").val(item.correo)
        $("#celular").val(item.celular)
        $("#direccion").val(item.direccion)        
        $("#estado").val((item.estado==true? 1:0))
    })
}



function dataAdd() {
    $.ajax({
        url: 'http://localhost:9000/api/security/person',
        data: JSON.stringify({
            tipoDocumento: $("#tipoDocumento").val(),
            documento: $("#documento").val(),
            nombreCompleto: $("#nombreCompleto").val(),
            correo: $("#correo").val(),
            celular: $("#celular").val(),
            direccion: $("#direccion").val(),            
            estado: parseInt($("#estado").val())
        }),
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (result) {
        findAll();
        dataClear();
    })
}

function dataUpdate() {
    $.ajax({
        url: 'http://localhost:9000/api/security/person/'+$("#id").val(),
        data: JSON.stringify({
            tipoDocumento: $("#tipoDocumento").val(),
            documento: $("#documento").val(),
            nombreCompleto: $("#nombreCompleto").val(),
            correo: $("#correo").val(),
            celular: $("#celular").val(),
            direccion: $("#direccion").val(),            
            estado: parseInt($("#estado").val())
        }),
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (result) {
        findAll();
        dataClear();
    })
}

function deleteById(id) {
    $.ajax({
        url: 'http://localhost:9000/api/security/person/'+id,
        method: "DELETE",
        headers: {
            "Content-Type": "application/json"
        }
    }).done(function (result) {
        findAll();
    })
}

function dataClear(){
    $("#id").val("")        
    $("#tipoDocumento").val("")
    $("#documento").val("")
    $("#nombreCompleto").val("")
    $("#correo").val("")
    $("#celular").val("")
    $("#direccion").val("")        
    $("#estado").val("")
}