<template>
    <div class="container">
        <div class="columns">
            <div class="column is-one-fifth">
                <aside class="menu">
                    <p class="menu-label is-size-6">
                        <strong>Student</strong>
                    </p>
                    <ul class="menu-list">
                        <li><a>Attendance</a></li>
                        <li><a>Reports</a></li>
                    </ul>
                    <p class="menu-label is-size-6">
                        <strong>Faculty</strong>
                    </p>
                    <ul class="menu-list">
                        <li><a>Attendance</a></li>
                        <li><a>Marks</a></li>
                        <li><a>FA Warning</a></li>
                    </ul>
                    <p class="menu-label is-size-6">
                        <strong>Time Table</strong>
                    </p>
                    <ul class="menu-list">
                        <li><a>View Today's Schedule</a></li>
                        <li><a>My Timetable</a></li>
                        <li><a>My Class Timetable</a></li>
                    </ul>
                </aside>
            </div>
            
            <div class="column" id="profile">
                <div class="container">
                    <div class="media">
                        <div class="media-content">
                            <h1 class="is-size-1 is-family-secondary"> {{ userData.name }} &nbsp;
                                <nuxt-link class="is-size-3 is-hidden-tablet" to="/edit-profile">✏️
                                </nuxt-link>
                            </h1>
                            <div class="content is-size-5 is-family-monospace">
                                <div class="media">
                                    <div class="media-left">💂 Gender:</div>
                                    <div class="media-content">{{ userData.gender }}</div>
                                </div>
                                <div class="media">
                                    <div class="media-left"> 📧 Email:</div>
                                    <div class="media-content">{{ userData.email }}</div>
                                </div>
                                <div class="media">
                                    <div class="media-left">☎️ Phone:</div>
                                    <div class="media-content">{{ userData.phone_number }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="media-right is-hidden-mobile">
                        <nuxt-link class="is-size-3" to="/edit-profile">✏️</nuxt-link>
                    </div>
                </div>       
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
//   * {
//     transition: all 0.3s ease-in-out;
//     background: var(--primary);
//     color: var(--light);
//   }

//   .is-fullwidth {
//     width: 100%;
//   }

//   #profile,
//   .is-center {
//     min-height: 100vh;
//     align-items: center;
//     justify-content: center;
//   }

//   .media-content {
//     max-width: 90vw;

//     h1 {
//       text-overflow: clip;
//       color: var(--font2);
//     }
//   }

//   .content {
//     padding-top: 2.5rem;
//   }

//   .pad {
//     padding: 1rem;
//   }

//   .box {
//     background: var(--tertiary);

//   }

//   .is-underlined {
//     text-decoration: underline;
//   }

</style>

<script>
    import firebase from '~/plugins/firebase'
    import db from '~/plugins/firebase'

    export default {
        data() {
            return {
                email: '',
                userData: {
                    name: '',
                    gender: '',
                    email: '',
                    phone_number: '',
                    display: '',
                },

            }
        },

        layout: 'nav',

        methods: {
            
        },

        created() {
            let user = firebase.auth().currentUser
            // db.collection('profile').doc(user.uid)
        }
    }
</script>