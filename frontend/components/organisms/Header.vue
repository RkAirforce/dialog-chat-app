<template>
  <v-app-bar
    app
    dense
    grey lighten-3
  >
    <v-toolbar-title>
      ChatTest
    </v-toolbar-title>
    <v-spacer />
    <LoginBar
     v-if="$auth.loggedIn"
    />
  </v-app-bar>
</template>

<script>
import LoginBar from '~/components/molecles/LoginBar'
export default {
  components: {
    LoginBar
  },
  data () {
    return {
      menus: [
        {
          title: 'home',
          to: '/'
        },
        {
          title: 'about',
          to: '/about'
        }
      ]
    }
  }
}
</script>