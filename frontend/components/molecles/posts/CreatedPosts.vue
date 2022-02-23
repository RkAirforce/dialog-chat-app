<template>
  <div>
    <v-row v-if="loading">
      <v-col
        v-for="n in 10"
        :key="n"
        cols="12"
        class="pb-0"
      >
        <v-skeleton-loader
          type="list-item-avatar, divider, list-item-three-line, actions"
        />
      </v-col>
    </v-row>
    <v-row
      v-for="post in posts"
      v-else
      :key="post.user.id"
      class="mb-3"
      style="border-bottom: solid 1px #ccc;"
    >
      <v-col cols="12" class="pb-0">
        <nuxt-link
          :to="{ path: `/users/${post.user.id}` }"
          style="color: inherit; text-decoration: none;"
        >
          <v-avatar
            v-if="post.user.image.url"
            color="white"
            size="35"
          >
            <v-img
              :src="post.user.image.url"
            />
          </v-avatar>
          <v-icon
            v-else
            size="40"
          >
            mdi-account-circle
          </v-icon>
          {{ post.user.name }}
        </nuxt-link>
      </v-col>
      <v-col cols="8">
        <v-card-text class="px-0">
          {{ post.content }}
        </v-card-text>
        <v-card-text class="px-0">
          {{ post.created_at }}
        </v-card-text>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  props: {
    posts: {
      type: Array,
      default: () => []
    },
    loading: {
      type: Boolean,
      default: null
    }
  }
}
</script>