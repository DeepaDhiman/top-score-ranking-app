<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue';
import VueRouter from 'vue-router';
// import axios from 'axios';
// Vue.prototype.$http = axios;

import Home from './packs/components/Home'
import Players from './packs/components/Players'
import PlayersHistory from './packs/components/PlayersHistory'

const router = new VueRouter({
  routes: [
    { 
      path: '/',
      component: Home  
    },
    { 
      path: '/score_details',
      component: Players  
    },
        { 
      path: '/players_history',
      component: PlayersHistory  
    }
  ]
})

Vue.use(VueRouter)

export default {
  router
}

</script>

<style scoped>
/* p {
  font-size: 2em;
  text-align: center;
} */
</style>
