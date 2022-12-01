<template>
  <div class="container">
    <div class="card text-white bg-success mb-3" style="max-width: 100%;">
      <div class="card-header">Sistema de Información RAS</div>
      <div class="card-body">        
        <!-- Agregar módulos -->
        <div class="dropdown">
          <button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton1"
            data-bs-toggle="dropdown" aria-expanded="false">
            Seguridad
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <li>
              <a class="dropdown-item" href="#">
                <router-link class="dropdown-item" to="/security/RegistroPersona">Registro Personas</router-link>
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="#">
                <router-link class="dropdown-item" to="/security/RegistroRol">Registro Rol</router-link>
              </a>
            </li>
            <li>
              <a class="dropdown-item" href="#">
                <router-link class="dropdown-item" to="/security/RegistroUsuario">Registro Usuario</router-link>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <router-view />
</template>

<style>
  body{
    margin-top: 1%;
  }
</style>