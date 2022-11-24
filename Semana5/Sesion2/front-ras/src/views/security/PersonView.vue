<template>
    <div class="person">        
        
        <div class="container">
            <NameView titleView="Registro Personas"/>   
            
            <!-- Formulario de datos de ingreso -->
            <br>
            <div class="form-group">

                <input type="hidden" id="id"><!-- Key del registro -->

                <label class="form-label mt-1">Documento</label>
                <select class="form-select" v-model="tipoDocumento">
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
                
               
                <SelectEstado nombreCampo="estado"></SelectEstado>         
            </div>

            <!-- Botones -->
            <div>
                <br>
                <button type="button" class="btn btn-primary" onclick="dataAdd();">Agregar</button>
                <button type="button" class="btn btn-primary" onclick="dataUpdate();">Modificar</button>
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
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
// @ is an alias to /src
import NameView from '@/components/NameView.vue'
import SelectEstado from '@/components/SelectEstado.vue'

export default {
  name: 'CardView',
  components: {
    NameView,
    SelectEstado
  }
}
</script>
