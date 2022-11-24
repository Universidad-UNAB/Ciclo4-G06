<template>
    <select class="form-select" v-model="dfds">
        <option disabled :selected="true">-- Seleccione --</option>
        <option value="1">Activo</option>
        <option value="0">Inactivo</option>
    </select>
</template>
  
<script>
export default {
    name: 'SelectEstado',
    props: {
        nombreCampo: String
    }
}
</script>