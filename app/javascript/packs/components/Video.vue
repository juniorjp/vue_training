<template>
  <div class="grid grid-cols-3 mb-4">
    <div >
      <img
        v-on:mouseover="isMouseOver = true"
        v-on:mouseout="isMouseOver = false"
        :src="getImageSource()"
      />
    </div>
    <div class="ml-2">
      <p>{{video.title}}</p>
      <p v-html="video.description"></p>
    </div>
    <div v-on:click="addVote">
        <i class="fas fa-heart fa-3x mx-2"></i>
        {{video.votes}} votes
    </div>
  </div>
</template>

<script>
export default {
    name: 'Video',
    props: ["video"],
    data(){
      return{
        isMouseOver: false
      }
    },
    methods: {
      getImageSource(){
        if(this.isMouseOver){
          return this.video.gif_preview
        }else{
          return this.video.main_poster
        }
      },
      addVote(){
        this.$emit('add-vote', this.video.id);
      }
    }
}
</script>

<style scoped>
  .fa-heart{
    color: blue;
    cursor: pointer;
  }
</style>
