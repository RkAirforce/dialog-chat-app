<template>
  <v-container
    fluid
  >
    <v-card
      tile
      color="brown lighten-5"
    >
      <v-row align="center" justify="center" no-gutters>
        <v-col xs="12" sm="10" md="8" lg="6">
          <v-layout class="py-3 pl-13" align-content-center>
            <v-list color="brown lighten-5">
              <v-list-item>
                <v-card-actions>
                  <v-avatar
                    v-if="user.image.url"
                    color="white"
                    size="65"
                  >
                    <v-img
                      :src="user.image.url"
                    />
                  </v-avatar>
                  <v-icon
                    v-else
                    size="65"
                  >
                    mdi-account-circle
                  </v-icon>
                  <span class="pl-2">{{ user.name }}</span>
                  <v-card-text>
                    {{ user.description }}
                  </v-card-text>
                </v-card-actions>
              </v-list-item>
            </v-list>
          </v-layout>
        </v-col>
      </v-row>
    </v-card>
    <v-card-text>
      <CreatePost
        v-if="$auth.user.id == user.id"
      />
    </v-card-text>
    <CreatedPosts
      :posts="posts"
      :loading="loading"
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
  data() {
    return {
      loading: false
    }
  },
  created() {
    setInterval(this.autoLoadPosts, 5000)
  },
  async fetch ({ $axios, params, store }) {
    this.loading = true
    await $axios.get(`api/v1/users/${params.id}`)
      .then((response) => {
        store.commit('users/setUser', response.data, { root: true })
        store.commit('posts/setPosts', response.data.posts, { root: true })
      })
      .catch((error) => {
        console.log(error)
        return error
      })
    this.loading = false
  },
  computed: {
    ...mapGetters({ user: 'users/user' }),
    ...mapGetters({ posts: 'posts/posts' })
  },
  methods: {
    autoLoadPosts() {
      const last_post = this.posts[0]
      if(last_post) {
        this.$axios.get('api/v1/posts/',{
          params: {
            id: last_post.id,
            user_id: this.user.id
          }
        })
          .then((response) => {
            let new_posts = response.data
            if(new_posts.length > 0) {
              new_posts.forEach((new_post) => {
                this.$store.commit('posts/addPosts', new_post, { root: true })
              })
            }
          })
          .catch((error) => {
            return error
          })
      }
    }
  }
}
</script>
