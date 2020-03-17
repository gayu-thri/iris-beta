<template>
    <div class="container">
        <nav class="navbar" role="navigation" aria-label="main navigation">
            <div class="navbar-brand">
                <a href="#" class="is-size-3 is-family-secondary navbar-item">🚀iris</a>

                <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                </a>
            </div>

            <div id="navbarBasicExample" class="navbar-menu">
                <div class="navbar-start">
                    <nuxt-link to="/dashboard" class="navbar-item">
                        Dashboard
                    </nuxt-link>

                    <nuxt-link to="/profile" class="navbar-item">
                        Profile
                    </nuxt-link>

                    <nuxt-link to="/notifications" class="navbar-item">
                        Notifications
                    </nuxt-link>

                    <nuxt-link to="/to-do" class="navbar-item">
                        To-Do List
                    </nuxt-link>

                    <nuxt-link to="/help" class="navbar-item">
                        Help
                    </nuxt-link>

                <!-- <div class="navbar-item has-dropdown is-hoverable">
                    <a class="navbar-link">
                    More
                    </a>

                    <div class="navbar-dropdown">
                    <a class="navbar-item">
                        About
                    </a>
                    <a class="navbar-item">
                        Jobs
                    </a>
                    <a class="navbar-item">
                        Contact
                    </a>
                    <hr class="navbar-divider">
                    <a class="navbar-item">
                        Report an issue
                    </a>
                    </div>
                </div> -->
                </div>

                <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                    <a class="button is-danger" @click="logout">
                        Log Out
                    </a>
                    </div>
                </div>
                </div>
            </div>
        </nav>
        <br>
        <nuxt />
    </div>
</template>

<script>
export default {
    methods: {
        logout() {
            this.$store.dispatch("signOut")
            .then(() => {
                this.$router.push("/")
            })
            .catch(err => {
                console.log(err.message)
            })
        }
    }
}
</script>