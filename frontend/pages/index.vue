<template>
  <v-container>
    <v-row>
      <v-col>
        <v-btn
          outlined
          color="warning"
          class="ml-2 font-weight-bold"
          to="/signup"
        >
          {{ $t('title.signup') }}
        </v-btn>
      </v-col>
      <v-col>
        <v-btn
          outlined
          color="info"
          class="ml-2 font-weight-bold"
          to="/signin"
        >
          {{ $t('title.signin') }}
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
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