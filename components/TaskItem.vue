<template>
    <div class="columns is-centered">

            <div class="column is-one-fifth">
                
            </div>

            <div class="column">
                    <button :class="className" class="button is-link is-light"
                    @click.self="$emit('complete')"
                >
                    {{ task.title }}
                </button>
            </div>

            <div class="column">
                <div class="container">
                    <button class="delete is-medium"
                            @click="$emit('remove')"
                    >
                    </button>
                </div>
            </div>  

            <div class="column is-one-fifth">

            </div>         
    </div>
</template>

<script>
    export default {
        name: 'TaskItem',
        props: ['task'],
        computed: {
            className() {
                let classes = ['tasks__item__toggle'];
                if (this.task.completed) {
                    classes.push('is-success');
                }
                return classes.join(' ');
            }
        }        
    }
</script>

