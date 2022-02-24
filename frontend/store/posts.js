export const state = () => ({
  post: {},
  posts: []
})

export const getters = {
  post: state => state.post,
  posts: state => state.posts
}

export const mutations = {
  setPost (state, post) {
    state.post = post
  },
  setPosts (state, posts) {
    state.posts = posts
    state.posts = state.posts.sort((a, b) => a.id < b.id ? 1 : -1)
  },
  deletePost (state, postId) {
    state.posts = state.posts.filter(post => post.id !== postId)
  },
  updatePost (state, postData) {
    state.posts = state.posts.map((post) => {
      if (post.id === postData.id) {
        post = postData
      }
      return post
    })
  },
  addPosts (state, post) {
    state.posts.push(post)
    state.posts = state.posts.sort((a, b) => a.id < b.id ? 1 : -1)
  },
}
