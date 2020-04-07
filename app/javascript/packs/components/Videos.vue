<template>
  <div>
    <div v-bind:key="video.id" v-for="video in videos">
      <Video v-bind:video="video" />
    </div>
  </div>
</template>

<script>
  import Video from './Video'
  export default {
    name: 'Videos',
    props: ['videos'],
    components: {
      Video
    }
  }
</script>

<style scoped>

</style>
