<template>
    <div class="person">

        <div class="container">
            <NameView titleView="Registro Personas" />

            <!-- Formulario de datos de ingreso -->
            <br>
            <div class="form-group">

                <input type="hidden" id="id"><!-- Key del registro -->

                <label class="form-label mt-1">Tipo Documento</label>
                <select class="form-select" v-model="tipoDocumento">
                    <option disabled :selected="true" value="">-- Seleccione --</option>
                    <option value="TI">TI</option>
                    <option value="CC">CC</option>
                    <option value="CE">CE</option>
                </select>

                <label class="form-label mt-1">Documento</label>
                <input type="number" class="form-control" v-model="documento"
                    placeholder="Ingresar número de documento">

                <label class="form-label mt-1">Nombre Completo</label>
                <input type="text" class="form-control" v-model="nombreCompleto" placeholder="Ingresar su nombre">

                <label class="form-label mt-1">Correo</label>
                <input type="text" class="form-control" v-model="correo" placeholder="Ingresar su correo">

                <label class="form-label mt-1">Celular</label>
                <input type="number" class="form-control" v-model="celular" placeholder="Ingresar su celular">

                <label class="form-label mt-1">Dirección</label>
                <input type="text" class="form-control" v-model="direccion" placeholder="Ingresar su dirección">

                <label class="form-label mt-1">Estado</label>
                <select class="form-select" v-model="estado">
                    <option disabled :selected="true" value="">-- Seleccione --</option>
                    <option value="1">Activo</option>
                    <option value="0">Inactivo</option>
                </select>
            </div>

            <!-- Botones -->
            <div>
                <br>
                <button class="btn btn-primary" @click="dataAdd()">Agregar</button>
                <button class="btn btn-primary" @click="dataUpdate()">Modificar</button>

            </div>

            <!-- Data de la API -->
            <table class="table table-hover">
                <br>
                <thead>
                    <tr class="table-active">
                        <th>Tipo documento</th>
                        <th>Documento</th>
                        <th>Nombre Completo</th>
                        <th>Correo</th>
                        <th>Celular</th>
                        <th>Dirección</th>
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody id="dataResult">
                    <!-- Aquí obtiene los datos de la API -->
                    <tr v-for="item in listData" :key="item.id">
                        <td>{{ item.tipoDocumento }}</td>
                        <td>{{ item.documento }}</td>
                        <td>{{ item.nombreCompleto }}</td>
                        <td>{{ item.correo }}</td>
                        <td>{{ item.celular }}</td>
                        <td>{{ item.direccion }}</td>
                        <td>{{ item.estado == true ? 'Activo' : 'Inactivo' }}</td>
                        <!-- boton para obtener el id de cada registro -->
                        <td><img src="../../../node_modules/bootstrap-icons/icons/pencil-square.svg"
                                @click="findByid(item.id)"></td>
                        <td><img src="../../../node_modules/bootstrap-icons/icons/trash2-fill.svg"
                                @click="deleteById(item.id)"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
// import NameView from '@/components/NameView.vue'
// export default {
//     name: 'CardView',
//     components: {
//         NameView
//     }
// }

import axios from 'axios';
import Swal from 'sweetalert2'
export default {
    name: 'PersonView',
    data() {
        return {
            id: 0,
            tipoDocumento: '',
            documento: '',
            nombreCompleto: '',
            correo: '',
            celular: '',
            direccion: '',
            estado: '',
            listData: [],
            listValidarPerson: []
        }
    },
    created() {
        this.loadData();
    },
    methods: {
        loadData: function () {
            axios.get('http://132.145.199.203:8080/api/security/person').then(result => {
                this.listData = result.data
            });

            axios.get('http://132.145.199.203:8080/api/security/user').then(result => {
                this.listValidarPerson = result.data
            })
        },
        findByid: function (id) {
            // metodo para consutlar por el ig del boton impreso en la vista
            axios.get('http://132.145.199.203:8080/api/security/person/' + id).then(result => {
                this.id = result.data.id;
                this.tipoDocumento = result.data.tipoDocumento;
                this.documento = result.data.documento;
                this.nombreCompleto = result.data.nombreCompleto;
                this.correo = result.data.correo;
                this.celular = result.data.celular;
                this.direccion = result.data.direccion;
                this.estado = (result.data.estado == true ? 1 : 0);
            })
        },
        deleteById: function (id) {
            var bandera;

            bandera = this.validarReferencia(id)

            if (bandera == true) {
                Swal.fire({
                    title: '¿Esta seguro?',
                    text: "Eliminar registro",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Si, eliminar este registro!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        axios.delete('http://132.145.199.203:8080/api/security/person/' + id,).then(() => {
                            this.MostrarMensaje("El registro se eliminó de forma correcta.", "success");
                            this.loadData();
                            this.clearList();
                        });
                    }
                })
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'No es posible eliminar este registro, hay un usuario asociado.'                    
                })
            }
        },
        clearList: function () {
            this.id = 0,
                this.tipoDocumento = '',
                this.documento = '',
                this.nombreCompleto = '',
                this.correo = '',
                this.celular = '',
                this.direccion = '',
                this.estado = '',
                this.listData = []
        },
        dataAdd: function () {
            let data = {
                tipoDocumento: this.tipoDocumento,
                documento: this.documento,
                nombreCompleto: this.nombreCompleto,
                correo: this.correo,
                celular: this.celular,
                direccion: this.direccion,
                estado: parseInt(this.estado)
            };
            axios.post('http://132.145.199.203:8080/api/security/person', data).then(result => {
                if (result.data) {
                    this.MostrarMensaje("El registro se guardó de forma correcta.", "success");
                    this.loadData();
                    this.clearList();
                } else {
                    this.MostrarMensaje("No fue posible guardar el registro.", "error");
                }
            });

        },
        dataUpdate: function () {
            let data = {
                id: this.id,
                tipoDocumento: this.tipoDocumento,
                documento: this.documento,
                nombreCompleto: this.nombreCompleto,
                correo: this.correo,
                celular: this.celular,
                direccion: this.direccion,
                estado: parseInt(this.estado)
            };

            axios.put('http://132.145.199.203:8080/api/security/person/' + this.id, data).then(result => {
                if (result.data) {
                    this.MostrarMensaje("El registro se modificó de forma correcta", "success");
                    this.loadData();
                    this.clearList();
                } else {
                    this.MostrarMensaje("No fue posible guardar el registro.", "error");
                }
            });

        },
        validarReferencia: function (id) {
            var bandera = true;

            this.listValidarPerson.forEach((item, index) => {
                if (item.personaId.id == id) {
                    bandera = false
                }
                console.log(index)
            })
            return bandera;
        },
        MostrarMensaje: function (mensaje, statusResult) {
            Swal.fire({
                icon: statusResult,
                title: mensaje,
                showConfirmButton: false,
                timer: 1500
            });
        }
    }
}

</script>
