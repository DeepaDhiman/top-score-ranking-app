<template>
  <div class="main-player-history-section">
    <form class="search-form">
      <div class="search-container">

        <div class="history-button">
          <button @click="back" type="button">Back</button>
        </div>      

        <div class="input-field">
          <input v-model="name" placeholder="Player Name">
        </div>

        <div class="history-button">
          <button @click="searchData" type="button">Search</button>
        </div>

      </div>
    </form>

    <div class="search-result" v-if="playerHistory.length > 0">
      <h3>
        {{ playerHistory[0].player_name }} Information
      </h3>

      <section>
        <header>
          <div class="col title">Score </div>
          <div class="col title">Score Date</div>
          <div class="col title">Delete</div>
        </header>
        <div class="row" v-for="(player, key) in playerHistory" :key="key">
          <div class="col">{{ player.score }}</div>
          <div class="col">{{ player.score_date }}</div>
          <div class="col">
            <button @click="deleteScore(player.id)" type="button">Delete</button>
          </div>
        </div>
      </section>

    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      searchResult: null,
      name: null
    }
  },

  computed: {
    playerHistory() {
      if (this.searchResult) {
        return this.searchResult;
      } else {
        return [];
      }
    }
  },

  methods: {
    back() {
      this.$router.push('/');
    },

    async searchData() {
      if (this.name) {
        try {
          const response = await axios.post("http://localhost:3000/search.json", 
            { "name": this.name }
          );

          this.searchResult = response.data;
        } catch (error) {
          console.log(error);
        }
      }
    },
    
    async deleteScore(score_id) {
      const response = await axios.delete(`http://localhost:3000/scores/${score_id}`);

      this.searchData();
    }

  }
}
</script>