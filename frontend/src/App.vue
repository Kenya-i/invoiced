<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div v-for="contact in contacts" :key="contact.id">
      {{contact.email}}
    </div>
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import axios from 'axios'
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',
  data() {
    return {
      contacts: [],
      hoge: "fsfsd"
    }
  },
  components: {
    HelloWorld
  },
  methods: {
    
  },
  mounted() {
    axios.get('http://localhost:3000/v1/contacts').then(res => {
          for(let i = 0; i < res.data.length; i++) {
              this.contacts.push(res.data[i])
          }
      })
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
