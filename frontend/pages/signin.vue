<template>
  <FormTemplate>
    <template #form-card-content>
      <ValidationObserver ref="form" v-slot="{ invalid }" immediate>
        <v-form>
          <TextFieldWithValidation
            v-model="email"
            label="メールアドレス"
            rules="required|email|max:30"
            outlined
          />
          <TextFieldWithValidation
            v-model="password"
            label="パスワード"
            autocomplete="on"
            vid="password"
            rules="required|alpha_dash|min:8|max:72"
            :type="show ? 'text' : 'password'"
            outlined
            :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show = !show"
          />
          <v-card-text class="px-0">
            <v-btn
              :disabled="invalid || loading"
              :loading="loading"
              block
              color="warning"
              class="white--text"
              @click="signIn"
            >
              ログインする
            </v-btn>
          </v-card-text>
          <v-divider />
          <v-card-text class="pb-8">
            <span>アカウントをお持ちでない方</span>
            <nuxt-link to="/signup">
              新規会員登録に移動
            </nuxt-link>
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
      password: '',
      guest: {
        auth: {
          email: 'guestuser@example.com',
          password: 'guestuser'
        }
      }
    }
  },
  methods: {
    ...mapActions({
      userLogin: 'auth/login'
    }),
     signIn() {
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
