<template>
    <nuxt />
</template>

<script>
    export default {
        layout: 'nav',

        created() {
            let user = firebase.auth().currentUser
        }
    }
</script>