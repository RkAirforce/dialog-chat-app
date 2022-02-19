<template>
  <div :style="{ marginTop: `${height}px`}">
    <v-footer
      absolute
      dark
      padless
      color="grey lighten-3"
      :height="height"
    >
      <v-col
        cols="12"
        class="py-0"
      >
        <div class="text-center text-primary">
          &copy;{{ copyRightYear }}
          <strong>{{ appName }}</strong>
        </div>
      </v-col>
    </v-footer>
  </div>
</template>

<script>
export default {
  data ({ $config: { appName } }) {
    return {
      appName,
      height: 40
    }
  },
  computed: {
    copyRightYear () {
      const thisYear = new Date().getFullYear()
      return thisYear
    }
  }
}
</script>
