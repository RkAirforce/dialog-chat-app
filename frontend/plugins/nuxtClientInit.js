export default async ({ $axios, store }) => {
  if (localStorage.uid) {
    await $axios.$get('/api/v1/logged_in', {params: { uid: localStorage.uid }})
    .then(currentUser => store.dispatch('getCurrentUser', currentUser))
    // Cookieはサーバーで削除済み
    .catch(() => {})
  }
}