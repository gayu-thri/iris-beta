<template>
    <div class="container">
        <div class="columns">
            <div class="column is-one-fifth">
                <aside class="menu">
                    <p class="menu-label is-size-6">
                        <strong>Profile</strong>
                    </p>
                    <ul class="menu-list">
                        <li @click="viewX"><a>View Profile</a></li>
                        <li @click="editX"><a>Edit Profile</a></li>
                    </ul>
                </aside>
            </div>
            
            <div class="column" id="profile">
                <template v-if="view">
                    <div class="container">
                        <div class="media">
                            <div class="media-content">
                                <h1 class="is-size-1 is-family-secondary"> {{ userData.name }} &nbsp;
                                    <nuxt-link class="is-size-3 is-hidden-tablet" to="/edit-profile">✏️
                                    </nuxt-link>
                                </h1>
                                <div class="content is-size-5 is-family-monospace">
                                    <div class="media">
                                        <div class="media-left">📧 Email: </div>
                                        <div class="media-content">{{ userData.email }}</div>
                                    </div>
                                    <div class="media">
                                        <div class="media-left">🏢 Department</div>
                                        <div class="media-content">{{ userData.department }}</div>
                                    </div>
                                    <div class="media">
                                        <div class="media-left">🏘️ Address:</div>
                                        <div class="media-content">{{ userData.address }}</div>
                                    </div>
                                    <div class="media">
                                        <div class="media-left">🎓 Qualification:</div>
                                        <div class="media-content">{{ userData.qualification }}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>       
                </template>

                <template v-else-if="edit">                    
                    <div class="container">
                        <div class="media">
                            <div class="media-content">
                                <h1 class="is-size-1 is-family-secondary"> {{ userData.name }} &nbsp;
                                    <nuxt-link class="is-size-3 is-hidden-tablet" to="/edit-profile">✏️
                                    </nuxt-link>
                                </h1>
                                <!-- <div class="content is-size-5 is-family-monospace">
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
                                </div> -->
                            </div>
                        </div>
                        <div class="media-right is-hidden-mobile">
                            <nuxt-link class="is-size-3" to="/edit-profile">✏️</nuxt-link>
                        </div>
                    </div>     
                </template>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>

</style>

<script>
    import firebase from '~/plugins/firebase'
    import { db } from '~/plugins/firebase'

    export default {
        data() {
            return {
                email: '',
                userData: {
                    name: '',
                    address: '',
                    department: '',
                    qualification: '',
                    dateOfBirth: ''
                },
                view: '',
                edit: ''
            }
        },

        async mounted() {
            let ans = db.collection('users').doc('saibalsu@gmail.com').get()
            .then(res => {
                console.log(res.data())
                this.userData.name = res.data().name
                this.userData.address = res.data().address
                this.userData.department = res.data().department
                this.userData.qualification = res.data().qualification
                this.userData.dateOfBirth = res.data().dateOfBirth
            })
            .catch(err => {
                console.log(err)
            })
        },

        layout: 'nav',

        methods: {
            viewX() {
               this.view = true
               this.edit = false
               console.log("view: "+this.view+" edit: "+this.edit)
            },
            editX() {
                this.edit = true
                this.view = false
                console.log("view: "+this.view+" edit: "+this.edit)
            }
        },

        created() {
            let user = firebase.auth().currentUser
            // db.collection('profile').doc(user.uid)
        }
    }
</script>