<template id="task-list">
    <div>
        <section class="tasks columns is-centered">
            <div class="column is-half">
                <h1 class="is-size-4 title has-text-centered">
                    Tasks ✨
                    <transition name="fade">
                    <small v-if="incomplete">({{ incomplete }})</small>
                    </transition>
                    
                </h1>
            </div>
        </section>
        <section class="columns is-centered">
            <div class="column is-one-fifth">
                
            </div>
            <div class="column control">
                <input type="text"
                    class="input is-medium is-rounded"
                    v-model="newTask"
                    @keyup.enter="addTask"
                    placeholder="New Task"
                >
            </div>
          
            <div class="column is-one-fifth">    
                <span class="input-group-button">
                <button @click="addTask" 
                        class="button is-success is-fullwidth is-medium is-rounded is-light"
                >
                    <i class="fa fa-plus"></i> Add ➕
                </button>
                </span>
            </div>
            <div class="column is-one-fifth">
                
            </div>
        </section>

        <section class="columns is-centered">
            <div class="column">

            </div>
            <div class="column">
                <button class="button is-fullwidth is-link is-light is-medium is-rounded"
                        @click="clearCompleted"
                >
                <i class="fa fa-check"></i> Clear Completed ✔️
                </button>
            </div>
            <div class="column">
                <button class="button is-fullwidth is-danger is-light is-medium is-rounded"
                        @click="clearAll"
                >
                <i class="fa fa-trash"></i> Clear All ❌
                </button>
            </div>
            <div class="column">
            
            </div>
        </section>

        <section class="columns is-centered">
            <transition-group name="fade" tag="ul" class="tasks__list no-bullet">
                <TaskItem v-for="(task, index) in tasks"
                            @remove="removeTask(index)"
                            @complete="completeTask(task)"
                            :task="task"
                            :key="task"
                ></TaskItem>
            </transition-group>
        </section>
    </div>
</template>

<style lang="stylus">
    .l {
        display: flex;
        justify-content: center;
    }
</style>

<script>

    import TaskItem from '~/components/TaskItem';

    export default {

    name: 'TaskList',

    components: {
        TaskItem
    },

  props: {
    tasks: {default: []}
  },
  data() {
    return {
      newTask: ''
    };
  },
  computed: {
    incomplete() {
      return this.tasks.filter(this.inProgress).length;
    }
  },
  methods: {
    addTask() {
      if (this.newTask) {
        this.tasks.push({
          title: this.newTask,
          completed: false
        });
        this.newTask = '';
      }
    },
    completeTask(task) {
      task.completed = ! task.completed;
    },
    removeTask(index) {
      this.tasks.splice(index, 1);
    },
    clearCompleted() {
      this.tasks = this.tasks.filter(this.inProgress);
    },
    clearAll() {
      this.tasks = [];
    },
    
    inProgress(task) {
      return ! this.isCompleted(task);
    },
    isCompleted(task) {
      return task.completed;
    }
  }
    }


</script>
