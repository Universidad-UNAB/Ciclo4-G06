function Mostrar(){
    alert("Buenos días");
    var data = document.getElementById('namePerson').value;

    data = data.toUpperCase();

    document.getElementById('conversion').value=data;
}