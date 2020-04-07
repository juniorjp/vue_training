<template>
  <div id="app">
    <p>Home</p>
    <Videos v-bind:videos="videos"/>
  </div>
</template>

<script>
  import Videos from './packs/components/Videos'
  import axios from 'axios'

  export default {
    components: {
      Videos
    },
    data() {
      return {
        videos: []
      }
    },
    created(){
      axios.get('https://fwfg.com/api/contents?category_id=23751')
        .then(res => this.videos = res.data)
        .catch(err => console.log(err))
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
