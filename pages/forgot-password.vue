<template>
  <div class>
    <div class="columns is-gapless">
      
      <section class="hero is-dark is-hidden-mobile is-vcentered">
        <div class="hero-body">
          <div class="container is-vcentered">
            <h1 class="title">
              Iris
            </h1>
            <h2 class="subtitle">
              A Modern Faculty Dashboard
            </h2>
          </div>
        </div>
      </section>
      
      <div class="column">
        <div class="container">
          <h2 class="title is-size-1 has-text-centered">Forgot your password? <br> Let's get your account back!</h2>
          <h4 class="is-size-5 has-text-centered">We'll send you an email where you can reset your password 😉</h4>
          <form @submit.prevent="recover" class="space">
            <div class="field xspace">
              <div class="control">
                 <input class="input is-shadowless" name="email" placeholder="Your email ID, please 😄" type="email" v-model="email">
              </div>
            </div>

            <div class="control">
              <button class="button is-rounded is-medium is-fullwidth login" type="submit">Help me recover 😅</button>
            </div>
          </form>

          <div class="has-text-centered xspace">
            <p>
              Already have an account?
              <nuxt-link to="/">Login!</nuxt-link>
            </p>
          </div><div class="has-text-centered">
            <p>
              Oops! Don't have an account?
              <nuxt-link to="/register">Register!</nuxt-link>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

  import firebase from 'firebase'

  export default {
    
    data() {
      return {
        email: ''
      }
    },

    computed: {

    },

    methods: {
      recover() {
        this.$store.dispatch("forgotPassword", {
          email: this.email
        })
        .then(() => {
            this.email = ''
            this.success = true
            this.$router.push('/')
        })
        .catch(err => {
            alert(err.message)
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
