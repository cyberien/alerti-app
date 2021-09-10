<template>
  <div class="col-12">
    <!-- Card -->
    <div class="card">
      <div class="card-header card-header-flush">
        <!-- Title -->
        <h4 class="card-header-title">
          {{ board.title }}
        </h4>

        <!-- Dropdown -->
        <div class="dropdown">
          <a
            href="#"
            class="dropdown-ellipses dropdown-toggle"
            role="button"
            data-bs-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            <i class="fe fe-more-vertical"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-end">
            <a href="" class="dropdown-item"> Rename this list </a>
            <a @click.stop="$emit('deleteBoard', index)" class="dropdown-item">
              Delete this list
            </a>
            <a href="" class="dropdown-item"> Add card </a>
          </div>
        </div>
      </div>
      <div class="card-body">
        <!-- Category -->
        <div class="kanban-category">
          <Card v-for="card in cards" :key="card.id" :card="card" />
        </div>

        <NewCard />
      </div>
    </div>
  </div>
</template>

<script>
import Card from "./Card.vue";
import NewCard from "./NewCard.vue";

import Api from "../services/api.js" ;

import { defineProps, reactive } from "vue";

export default {
  name: "board",
  props: ["board"],
  data: function () {
    return {
      cards: [],
    };
  },
  components: {
    Card,
    NewCard,
  },
  emits: ["deleteBoard","addBoard"],
  created() {
     Api.getCards(this.board.id)
      .then((data) => {
        this.cards = data;
      })
      .catch((err) => console.log(err));
  },
  methods: {
    deleteCard: function (id) {
      if (this.cards.length > 0) {
        this.cards.splice(id, 1);
      }
    },
  },
};
</script>

<style scoped>
a {
  color: #42b983;
}
</style>
