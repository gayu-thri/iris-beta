import Vuex from 'vuex'
import { auth } from '~/plugins/firebase.js'

const createStore = () => {
    return new Vuex.Store({
        state: {
            user: '',
        },

        getters: {
            user(state) {
                return state.user
            },

            isAuthenticated(state) {
                return !!state.user
            }
        },

        mutations: {
            setUser(state, payload) {
                state.user = payload
            }
        },

        actions: {
            signUp({ commit }, { email, password }) {
                return auth.createUserWithEmailAndPassword(email, password)
            },

            signInWithEmail({ commit }, { email, password }) {
                return auth.signInWithEmailAndPassword(email, password)
            },
            
            signOut() {
                return auth.signOut()
            },

            forgotPassword({ commit }, { email }) {
                return auth.sendPasswordResetEmail(email)
            },

            returnUserDetails() {
                return auth.currentUser;
            }
        }
    })
}

export default createStore