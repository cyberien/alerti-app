<template>
  <div
    class="tab-pane fade show active"
    id="kanbanColumns"
    role="tabpanel"
    aria-labelledby="kanbanColumnsToggle"
  >
    <div class="container-fluid kanban-container">
      <div class="row">
        <Board
          v-for="board in boards"
          :key="board.id"
          :board="board"
          @delete-board="deleteBoard"
        />

        <NewBoard :workspace="1" />

        <CardModal v-if="isModalOpen" v-model:isOpen="isModalOpen" />
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import Board from "./components/Board.vue";
import NewBoard from "./components/NewBoard.vue";
import CardModal from "./components/CardModal.vue";

import Api from "./services/api.js" ;

export default {
  data: function () {
    return {
      boards: [],
    };
  },
  components: {
    Board,
    NewBoard,
    CardModal,
  },
  created() {
      this.boards = Api.getBoards().catch(error => {
      console.log(error)
    });
  },
  methods: {
    deleteBoard: function (id) {

      let success =  Api.deleteBoard(id);

      if (success) {
        if (this.boards.length > 0) {
          this.boards.splice(id, 1);
        }
      }
    },
  },
};
</script>

<style>
#kanban {
}
</style>
