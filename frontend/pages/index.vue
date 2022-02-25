<template>
  <v-container>
    <v-row v-if="!$auth.loggedIn">
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
import TextFieldWithValidation from '~/components/atoms/TextFieldWithValidation'

export default {
  components: {
    TextFieldWithValidation
  }
}
</script>