<template>
  <div>
    {{ number }}
    {{ $auth.user }}
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import TextFieldWithValidation from '~/components/atoms/TextFieldWithValidation'

export default {
  data() {
    return {
      number: {}
    }
  },
  components: {
    TextFieldWithValidation
  },
  mounted() {
    this.$axios.$get('/api/v1/posts')
      .then(
        (response) => {
          this.number = response
        },
        (error) => {
          return error
        }
      )
  }
}
</script>