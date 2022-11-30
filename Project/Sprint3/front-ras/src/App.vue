<template>
  <nav>
    <router-link to="/security/RegistroPersona">Registro Personas</router-link> | 
    <router-link to="/security/RegistroRol">Registro Rol</router-link> |
    <router-link to="/security/RegistroUsuario">Registro Usuario</router-link> 

    <!-- iniciar sesión -->
    <!-- <router-link to="/index">Index</router-link> -->

<!-- 
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>  -->
    
  </nav>
  <router-view/>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
