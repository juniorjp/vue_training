<template>
  <div>
    <p>{{video.title}}</p>
    <p>{{video.description}}</p>
  </div>
</template>

<script>
export default {
    name: 'Video',
    props: ["video"]
}
</script>

<style scoped>

</style>
