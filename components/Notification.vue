<template>
  <div :class="type" class="notification">
    {{ message }}
  </div>
</template>
<script>
export default {
  name: 'Notification',
  props: ['message', 'type'],
  computed: {
    notifClass: function(){
      return {
        "notification is-success": type == 'is-success',
        "notification is-danger": type == 'is-danger'
      }
    }
  }
}
</script>