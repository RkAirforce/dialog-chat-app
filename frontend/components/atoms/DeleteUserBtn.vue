<template>
  <v-card-text class="py-0">
    <v-btn
      color="error"
      text
      @click="deleteUser"
    >
      退会はこちら
    </v-btn>
  </v-card-text>
</template>

<script>
export default {
  methods: {
    async deleteUser () {
      if (window.confirm('退会してもよろしいですか？')) {
        await this.$axios.$delete(`/api/v1/auth/${this.$auth.user.id}`, {
          headers: {
            "access-token": localStorage.getItem("access-token"),
            uid: localStorage.getItem("uid"),
            client: localStorage.getItem("client"),
          },
        })
          .then(
            (response) => {
              this.$auth.logout()
              this.$store.dispatch(
                'flash/showMessage',
                {
                  message: response.message,
                  color: 'success',
                  status: true
                },
                { root: true }
              )
              this.$router.push('/')
            },
            (error) => {
              this.$store.dispatch(
                'flash/showMessage',
                {
                  message: error,
                  color: 'error',
                  status: true
                },
                { root: true }
              )
              return error
            }
          )
      }
    }
  }
}
</script>
