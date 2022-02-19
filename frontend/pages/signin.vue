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
              @click="signup"
            >
              登録する
            </v-btn>
          </v-card-text>
          <v-divider />
          <v-card-text class="pb-8">
            <span>すでにアカウントをお持ちですか？</span>
            <nuxt-link to="/signin">
              ログインに移動
            </nuxt-link>
          </v-card-text>
        </v-form>
      </ValidationObserver>
    </template>
  </FormTemplate>
</template>

<script>
import TextFieldWithValidation from '~/components/atoms/TextFieldWithValidation'
import FormTemplate from '~/components/molecles/FormTemplate'

export default {
 components: {
   TextFieldWithValidation,
   FormTemplate
 }
}
</script>
