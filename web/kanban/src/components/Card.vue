<template>


<!-- Card -->
          <div class="kanban-item">
            <div
              class="card card-sm mb-3"
              data-bs-toggle="modal"
              data-bs-target="#modalKanbanTask"
            >
              <div class="card-body">
                <!-- Body -->
                <p class="mb-0"  @click.stop="$emit('openCard', index)">
                  {{ card.title }}
                </p>
              </div>
            </div>
          </div>


</template>

<script>
import { defineProps, reactive } from 'vue'


export default {
  name: "card",
  props: ["card"],
    emits: ["deleteCard"],
};

</script>

<style scoped>
a {
  color: #42b983;
}
</style>
