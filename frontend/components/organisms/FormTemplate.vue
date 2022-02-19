<template>
  <v-card>
    <v-row
      align="center"
      justify="center"
    >
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
</template>
