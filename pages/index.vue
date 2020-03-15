<template>
  <div class>
    <div class="columns is-gapless">
      
      <section class="hero is-dark is-hidden-mobile is-vcentered">
        <div class="hero-body">
          <div class="container is-vcentered">
            <h1 class="title is-family-secondary">
              iris
            </h1>
            <h2 class="subtitle">
              A Modern Faculty Dashboard
            </h2>
          </div>
        </div>
      </section>
      
      <div class="column">
        <div class="container">
          <h2 class="title is-size-1 has-text-centered">Welcome to Iris!</h2>

          <Notification :message="msg" v-if="msg" :type="notif" />

          <form @submit.prevent="signIn" class="space is-family-primary">
            <div class="field xspace">
              <div class="control">
                 <input class="input is-shadowless" name="email" placeholder="Your email ID, please 😄" type="email" v-model="email">
              </div>
            </div>

            <div class="field">
              <div class="control">
                <input class="input is-shadowless" name="password" placeholder="Enter your password 🙈" type="password" v-model="password"/>
              </div>
            </div>

            <div class="is-pulled-right xspace">
              <nuxt-link to="/forgot-password">Forgot Password?</nuxt-link>
            </div>
            <div class="control">
              <button class="button is-rounded is-medium is-fullwidth login" type="submit">Log In</button>
            </div>
          </form>

          <div class="has-text-centered redirect space">
            <p>
              Don't have an account?
              <nuxt-link to="/register">Register Now!</nuxt-link>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

  import Notification from '~/components/Notification.vue'
  import Logo from '~/components/Logo.vue'
  import firebase from 'firebase'

  export default {
    components: {
      Logo,
      Notification
    },

    data() {
      return {
        email: '',
        password: '',
        msg: ''
      }
    },

    computed: {

    },

    methods: {
      signIn() {
        this.$store.dispatch("signInWithEmail", {
          email: this.email,
          password: this.password
        })
        .then(() => {
            this.email = ''
            this.password = ''
            this.notif = 'is-success'
            this.msg = "Login Successful! Redirecting to Profile"
            setTimeout(() => this.$router.push('/profile_edit'), 5000)
        })
        .catch(err => {
            this.notif = 'is-danger'
            this.msg = err.message
            this.email = ''
            this.password = ''
        });
      }
    }
  }
</script>

<style>


.title {
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont,
    'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
/* 
input {
  border:
} */

.redirect {
  margin-bottom: 3rem;
}

.space {
  padding-top: 3rem;
  padding-bottom: 2rem;
}

.column {
  display: flex;
  align-items: center;
  justify-content: center;
}

.columns {
  min-height: 100vh;
}

.container {
  max-width: calc(100% - 20vw);
}

.xspace {
  padding-bottom: calc(0.65rem + 1vh);
}

</style>
