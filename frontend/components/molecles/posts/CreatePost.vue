<template>
  <v-dialog
    v-model="dialog"
    persistent
    max-width="600"
  >
    <template #activator="{ on, attrs }">
      <v-btn
        v-bind="attrs"
        color="info"
        v-on="on"
      >
        <v-icon
          left
        >
          mdi-comment-outline
        </v-icon>
        つぶやく
      </v-btn>
    </template>
    <v-card>
      <v-banner class="grey lighten-5" sticky outlined>
        <v-btn
          class="float-right"
          text
          @click="dialog = false"
        >
          <v-icon>
            mdi-close
          </v-icon>
        </v-btn>
      </v-banner>
      <ValidationObserver ref="form" v-slot="{ invalid }" immediate>
        <v-container>
          <v-form>
            <v-card-text class="pb-0">
              <TextAreaWithValidation
                v-model="content"
                label="つぶやき"
                rules="required"
                outlined
              />
            </v-card-text>
            <v-card-text>
              <v-btn
                :disabled="invalid || loading"
                :loading="loading"
                block
                color="warning"
                class="white--text"
                @click="createPost"
              >
                つぶやく
              </v-btn>
            </v-card-text>
          </v-form>
        </v-container>
      </ValidationObserver>
    </v-card>
  </v-dialog>
</template>

<script>
import TextAreaWithValidation from '~/components/atoms/TextAreaWithValidation'
export default {
  components: {
    TextAreaWithValidation
  },
  data () {
    return {
      content: '',
      dialog: false,
      loading: false,
      tab: null
    }
  },
  methods: {
    async createPost () {
      const isValid = await this.$refs.form.validate()
      const formData = new FormData()
      this.loading = true
      if (isValid) {
        formData.append('post[user_id]', this.$auth.user.id)
        formData.append('post[content]', this.content)
        await this.$axios.$post('/api/v1/posts', formData)
          .then(
            (response) => {
              this.$store.commit('posts/addPosts', response, { root: true })
              this.content = ''
              this.$refs.form.reset()
            },
            (error) => {
              return error
            }
          )
      }
      this.loading = false
      this.dialog = false
    }
  }
}
</script>