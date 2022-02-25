export const state = () => ({
  current: {
    user: null
  }
})

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  async signup ({ dispatch }, params) {
    await this.$axios.$post('/api/v1/auth', params)
      .then(
        (response) => {
          console.log(response)
          dispatch('authSuccessful', response.data)
          this.$router.push('/')
        },
        (error) => {
          dispatch('authFailure', error)
        }
      )
  },
  async login ({ dispatch }, params) {
    await this.$axios.$post('/api/v1/auth/sign_in', params)
      .then(
        (response) => {
          console.log(response.data)
          dispatch('authSuccessful', response.data)
          this.$router.push('/')
        },
        (error) => {
          dispatch('authFailure', error)
        }
      )
  },
  async authSuccessful ({ dispatch }, response) {
    await this.$auth.login(response)
  },
  authFailure ({ response }) {
    console.log(response)
  }
}
