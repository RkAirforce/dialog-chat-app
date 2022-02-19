<template>
  <FormTemplate>
    <template #form-card-content>
      <ValidationObserver ref="form" v-slot="{ invalid }" immediate>
        <v-form>
          <TextFieldWithValidation
            v-model="name"
            label="ユーザー名"
            placeholder="あなたの表示名"
            :counter="15"
            rules="max:15|required"
            outlined
          />
          <TextFieldWithValidation
            v-model="email"
            label="メールアドレス"
            rules="required|email|max:30"
            outlined
          />
          <TextFieldWithValidation
            v-model="email"
            label="メールアドレス"
            rules="required|email|max:30"
            outlined
          />
          <TextFieldWithValidation
            v-model="password"
            label="パスワード"
            rules="required|alpha_dash|min:8|max:72"
            :type="show ? 'text' : 'password'"
            outlined
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            vid="password"
            @click:append="show = !show"
          />
          <v-card-text class="px-0">
            <v-btn
              :disabled="invalid || loading"
              :loading="loading"
              block
              color="info"
              class="white--text"
              @click="login"
            >
              ログインする
            </v-btn>
          </v-card-text>
        </v-form>
      </ValidationObserver>
    </template>
  </FormTemplate>
</template>

<script>
import { mapActions } from 'vuex'
import TextFieldWithValidation from '~/components/atoms/TextFieldWithValidation'
import FormTemplate from '~/components/molecles/FormTemplate'

export default {
  components: {
    TextFieldWithValidation,
    FormTemplate
  },
  middleware: 'authenticated',
  data () {
    return {
      show: false,
      loading: false,
      email: '',
      name: '',
      password: ''
    }
  },
  methods: {
    ...mapActions({
      userLogin: 'auth/login'
    }),
    login () {
      const isValid = this.$refs.form.validate()
      const formData = new FormData()
      this.loading = true
      formData.append('email', this.email)
      formData.append('password', this.password)
      
      if (isValid) {
        this.userLogin(formData)
      }
      this.loading = false
    }
  }
}
</script>
