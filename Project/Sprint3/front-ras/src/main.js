import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import bootswatch from '../node_modules/bootswatch/dist/simplex/bootstrap.css'
// import bootstrap from '../node_modules/bootstrap/dist/css/bootstrap.css'
// import bootstrapCss from '../node_modules/bootstrap/dist/css/bootstrap.min.css'
import bootstrapJs from '../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js'

createApp(App,bootswatch,bootstrapJs).use(router).mount('#app')
