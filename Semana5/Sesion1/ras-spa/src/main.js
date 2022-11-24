import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import Bootswatch from '../node_modules/bootswatch/dist/litera/bootstrap.css'

createApp(App,Bootswatch).use(router).mount('#app')
