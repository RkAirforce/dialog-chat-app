<template>
  <v-container>
    <ValidationObserver ref="form" v-slot="{ invalid }" immediate>
      <v-card-title>
        基本情報
      </v-card-title>
      <v-divider />
      <v-form>
        <ImageFileWithValidation
          v-model="image"
          rules="mimes:image/*|ext:jpeg,jpg,png"
          label="プロフィール画像"
        />
        <TextFieldWithValidation
          v-if="name=='guestuser'"
          v-model="name"
          label="ユーザー名"
          placeholder="あなたの表示名"
          :counter="15"
          rules="max:15|required"
          disabled
          outlined
        />
        <TextFieldWithValidation
          v-else
          v-model="name"
          label="ユーザー名"
          placeholder="あなたの表示名"
          :counter="15"
          rules="max:15|required"
          outlined
        />
        <TextFieldWithValidation
          v-if="email=='guestuser@example.com'"
          v-model="email"
          label="メールアドレス"
          rules="required|email|max:30"
          disabled
          outlined
        />
        <TextFieldWithValidation
          v-else
          v-model="email"
          label="メールアドレス"
          rules="required|email|max:30"
          outlined
        />
        <TextAreaWithValidation
          v-model="description"
          label="自己紹介"
          rules="max:1000"
          :counter="1000"
          outlined
        />
        <v-card-text class="px-0">
          <v-btn
            :disabled="invalid || loading"
            :loading="loading"
            block
            color="warning"
            class="white--text"
            @click="updateProfile"
          >
            保存する
          </v-btn>
        </v-card-text>
      </v-form>
    </ValidationObserver>
  </v-container>
</template>

<script>
import TextFieldWithValidation from '~/components/atoms/TextFieldWithValidation'
import TextAreaWithValidation from '~/components/atoms/TextAreaWithValidation'
import ImageFileWithValidation from '~/components/atoms/ImageFileWithValidation'

export default {
  components: {
    TextFieldWithValidation,
    TextAreaWithValidation,
    ImageFileWithValidation
  },
  data () {
    return {
      loading: false,
      image: null,
      name: this.$auth.user.name,
      email: this.$auth.user.email,
      description: this.$auth.user.description
    }
  },
  methods: {
    async updateProfile () {
      const isValid = await this.$refs.form.validate()
      const formData = new FormData()
      this.loading = true

      if (isValid) {
        if (this.image) { formData.append('image', this.image) }
        formData.append('name', this.name)
        formData.append('email', this.email)
        formData.append('description', this.description)
        this.loading = true
        await this.$axios.$patch('/api/v1/auth', formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
          .then(
            (response) => {
              this.$store.dispatch('getCurrentUser', response.data)
            },
            (error) => {
              return error
            }
          )
        this.loading = false
      }
    }
  }
}
</script>
