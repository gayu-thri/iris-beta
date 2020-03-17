<template>
    <div class="container">
        <div class="column">
            <div class="columns"></div>
            <div class="box">
                <task-list :tasks="tasks"></task-list>
            </div>
            <div class="columns"></div>
        </div>
    </div>
</template>

<script>
    import TaskList from '~/components/TaskList'
    import TaskItem from '~/components/TaskItem'

    export default {
        components: {
            TaskList,
            TaskItem
        },

        layout: 'nav'
    }
</script>