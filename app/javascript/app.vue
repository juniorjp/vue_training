<template>
  <div id="app">
    <p>Home</p>
    <p>Votes left: {{user.votes}}</p>
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
        videos: [],
        user: {}
      }
    },
    created(){
      axios.get('/videos')
        .then(res => this.videos = res.data)
        .catch(err => console.log(err))

      this.syncUser()
    },
    methods: {
      syncUser(){
        const storedUser = localStorage.getItem('video_home_user');
        let user = null;
        if(storedUser) {
          this.user =  JSON.parse(storedUser);
          return null
        }

        this.user = axios.post('/users', {},
          {
            headers: {
              'Content-Type': 'application/json',
              'api_version': 'v1',
              'X-CSRF-Token': getPageToken(),
            }
          }
        )
          .then(res => {
            this.user = res.data
            localStorage.setItem('video_home_user', JSON.stringify({...this.user, votes: 50}));
          })
          .catch(err => console.log(err))
      }
    }

  }

  const getPageToken = function(){
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
