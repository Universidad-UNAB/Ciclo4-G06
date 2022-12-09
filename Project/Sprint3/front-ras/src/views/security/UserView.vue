<template>
    <div class="user">

        <div class="container">
            <NameView titleView="Registro Usuarios" />

            <!-- Formulario de datos de ingreso -->
            <br>
            <div class="form-group">

                <input type="hidden" id="id"><!-- Key del registro -->

                <label class="form-label mt-1">Usuario</label>
                <input type="text" class="form-control" v-model="usuario" placeholder="Ingresar usuario">

                <label class="form-label mt-1">Contraseña</label>
                <input type="password" class="form-control" v-model="contrasenia" placeholder="Ingresar contraseña">

                <label class="form-label mt-1">Persona</label>
                <select class="form-select" v-model="personaId">  
                    <option disabled :selected="true" value="">-- Seleccione --</option>                  
                    <option v-for="item in listPerson" :key="item.id" :value="item.id">{{item.nombreCompleto}}</option>
                </select>
                
                <label class="form-label mt-1">Rol</label>
                <select class="form-select" v-model="rolId">
                    <option disabled :selected="true" value="">-- Seleccione --</option>
                    <option v-for="item in listRole" :key="item.id" :value="item.id">{{item.nombre}}</option>
                </select>

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
                        <th>Usuario</th>                        
                        <th>Persona</th>
                        <th>Rol</th>
                        <th>Estado</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody id="dataResult">
                    <!-- Aquí obtiene los datos de la API -->
                    <tr v-for="item in listData" :key="item.id">
                        <td>{{ item.usuario }}</td>
                        <td>{{ item.personaId.nombreCompleto }}</td>
                        <td>{{ item.rolId.nombre }}</td>
                        <td>{{ item.estado == true ? 'Activo' : 'Inactivo' }}</td>
                        <!-- boton para obtener el id de cada registro -->
                        <td><img src="../../../node_modules/bootstrap-icons/icons/pencil-square.svg" @click="findByid(item.id)"></td>
                        <td><img src="../../../node_modules/bootstrap-icons/icons/trash2-fill.svg" @click="deleteById(item.id)"></td>
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
    name: 'RoleView',
    data() {
        return {
            id: 0,
            usuario: '',
            contrasenia: '',
            personaId: '',
            rolId: '',
            estado: '',
            listData: [],
            listPerson: [],
            listRole: []
        }
    },
    created() {
        this.loadData();
    },
    methods: {
        loadData: function () {
            axios.get('http://132.145.199.203:8080/api/security/user').then(result => {
                this.listData = result.data
            });

            axios.get('http://132.145.199.203:8080/api/security/person').then(result => {
                this.listPerson = result.data
            });
            
            axios.get('http://132.145.199.203:8080/api/security/role').then(result => {
                this.listRole = result.data
            });
        },
        findByid: function (id) {
            // metodo para consutlar por el ig del boton impreso en la vista
            axios.get('http://132.145.199.203:8080/api/security/user/' + id).then(result => {
                this.id = result.data.id;
                this.usuario = result.data.usuario;
                this.personaId = result.data.personaId.id;
                this.rolId = result.data.rolId.id;
                this.estado = (result.data.estado == true ? 1 : 0);
            })
        },
        deleteById: function (id) {
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
                    axios.delete('http://132.145.199.203:8080/api/security/user/' + id,).then(() => {
                        this.MostrarMensaje("El registro se eliminó de forma correcta.", "success");
                        this.loadData();
                        this.clearList();
                    });
                }
            })
        },
        clearList: function () {
            this.id = 0,
            this.usuario = '',
            this.contrasenia = '',
            this.personaId = '',
            this.rolId = '',
            this.estado = '',
            this.listData = []
        },
        dataAdd: function () {
            let data = {                
                usuario: this.usuario,
                contrasenia: this.contrasenia,
                personaId: {
                    id:this.personaId
                },
                rolId: {
                    id:this.rolId
                },
                estado: parseInt(this.estado)
            };
            axios.post('http://132.145.199.203:8080/api/security/user', data).then(result => {
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
                usuario: this.usuario,
                contrasenia: this.contrasenia,
                personaId: {
                    id:this.personaId
                },
                rolId: {
                    id:this.rolId
                },
                estado: parseInt(this.estado)
            };

            axios.put('http://132.145.199.203:8080/api/security/user/' + this.id, data).then(result => {
                if (result.data) {
                    this.MostrarMensaje("El registro se modificó de forma correcta", "success");
                    this.loadData();
                    this.clearList();
                } else {
                    this.MostrarMensaje("No fue posible guardar el registro.", "error");
                }
            });

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
