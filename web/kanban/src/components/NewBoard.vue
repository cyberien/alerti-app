<template>


<div class="col-12">
          <div class="kanban-add">
            <div class="card mb-0">
              <div class="card-body">
                <!-- Link -->
                <div class="text-center">
                  <a class="kanban-add-link"  @click.stop="$emit('addBoard')">Add list</a>
                </div>

                <!-- Form -->
                <form class="kanban-add-form d-none">
                  <div class="d-flex align-items-center">
                    
                    <input class="input" type="text" value="{{workspace}}"/>
                    <input
                      type="text"
                      class="form-control form-control-flush form-control-auto h4"
                      placeholder="Name your list"
                    />

                    <!-- Close -->
                    <button class="btn-close ms-3" type="reset"></button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>


</template>

<script setup>

import { defineProps, reactive } from 'vue'

defineProps({
  workspace: Number
})

const state = reactive({ count: 0 })


</script>

<style scoped>
a {
  color: #42b983;
}
</style>
