<template>
  <v-row
    align="center"
    justify="center"
  >
    <v-col
      cols="8"
      class="my-8 text-center"
    >
      <v-card>
        <v-row
          align="center"
          justify="center"
        >
          <v-col
            cols="12"
            class="my-8 text-center"
          >
            <h1 class="text-h5 font-weight-bold">
              {{ pageTitle }}
            </h1>
          </v-col>
          <v-card
            flat
            width="80%"
            max-width="400"
            color="transparent"
          >
            <slot name="form-card-content" />
          </v-card>
        </v-row>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data ({ $route }) {
    return {
      pageTitle: this.$t(`title.${$route.name}`)
    }
  }
}
</script>