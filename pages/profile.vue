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
                                        <div class="media-content">{{ email }}</div>
                                    </div>
                                    <div class="media">
                                        <div class="media-left">🎂 Date of Birth: </div>
                                        <div class="media-content">{{ userData.dateOfBirth }}</div>
                                    </div>
                                    <div class="media">
                                        <div class="media-left">🏢 Department: </div>
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
                        <Notification :message="msg" v-if="msg" :type="notif" />
                        <div class="media">
                            <div class="media-content">
                                <form @submit.prevent="update">
                                    <h1 class="is-size-1 is-family-secondary">
                                        <input class="is-size-1 is-family-secondary" type="text" :placeholder='userData.name'
                                            v-model="newName" />
                                    </h1>
                                    <div class="content is-size-5 is-family-monospace">
                                        <div class="media">
                                            <div class="media-left">📧 Email: </div>
                                            <div class="media-content">{{ email }}</div>
                                        </div>
                                        <div class="media">
                                            <div class="media-left">🎂 Date of Birth: </div>
                                            <input class="is-size-5 is-family-monospace" type="text" :placeholder='userData.dateOfBirth'
                                            v-model="newDob" />
                                        </div>
                                        <div class="media">
                                            <div class="media-left">🏢 Department: </div>
                                            <div class="media-content">{{ userData.department }}</div>
                                        </div>
                                        <div class="media">
                                            <div class="media-left">🏘️ Address:</div>
                                            <input class="is-size-5 media-content" type="text" :placeholder='userData.address'
                                            v-model="newAddress" />
                                        </div>
                                        <div class="media">
                                            <div class="media-left">🎓 Qualification:</div>
                                            <div class="media-content">{{ userData.qualification }}</div>
                                        </div>
                                        <br>
                                        <p class="pad">Hint: You can only edit your name, address and date of birth.</p>
                                        <div class="control">
                                            <button type="submit"
                                            class="button is-rounded is-medium is-family-monospace" style="margin-top: 2.5rem;">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
    import Notification from '~/components/Notification.vue'

    export default {
        components: {
            Notification
        },

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
                newAddress: '',
                newDob: '',
                newName: '',
                view: true,
                edit: '',
                msg: ''
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
                this.email = res.data().email
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
            },
            update() {
                db.collection('users').doc('saibalsu@gmail.com').update({
                    address: this.newAddress,
                    name: this.newName,
                    dateOfBirth: this.newDob,
                    timestamp: firebase.firestore.FieldValue.serverTimestamp()
                })
                .then(() => {
                    this.msg = 'Successfully updated new details!'
                    this.notif = 'is-success'
                    this.userData.name = this.newName
                    this.userData.dateOfBirth = this.newDob
                    this.userData.address = this.newAddress
                })
                .catch(err => {
                    this.notif = 'is-danger'
                    this.msg = err.message
                })
            }
        },

        created() {
            let user = firebase.auth().currentUser
            // db.collection('profile').doc(user.uid)
        }
    }
</script>