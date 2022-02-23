<template>
  <v-container class="mt-5">
    <CreatePost
     v-if="$auth.user"
    />
    <CreatedPosts
      :posts="posts"
    />
  </v-container>
</template>

<script>
import { mapGetters } from 'vuex'
import CreatedPosts from '~/components/molecles/posts/CreatedPosts'
import CreatePost from '~/components/molecles/posts/CreatePost'

export default {
  components: {
    CreatedPosts,
    CreatePost
  },
  mounted() {
       await this.$axios.$get('api/v1/auto_loading', {data: {id: 1}})
      .then((response) => {
        console.log(response.data)
        store.commit('posts/setPosts', response.data, { root: true })
      })
      .catch((error) => {
        return error
      })
    setInterval(function () {
      console.log('hi')
    }, 5000)
  },
  async fetch ({ $axios, store }) {
    await $axios.get('api/v1/posts')
      .then((response) => {
        console.log(response.data)
        store.commit('posts/setPosts', response.data, { root: true })
      })
      .catch((error) => {
        console.log(error)
        return error
      })
  },
  computed: {
    ...mapGetters({ posts: 'posts/posts' }),
  }
}
</script>
