<template>
  <div class="main-home-section">
    <h2>
      Top Score Ranking App
    </h2>

    <div class="button-listing">
      <button @click="getScoreDetails" type="button">Get Score Filter</button>
    </div>

    <div class="button-listing">
      <button @click="getPlayersHistory" type="button">Get Players History</button>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    getScoreDetails() {
      this.$router.push('score_details');
    },

    getPlayersHistory() {
      this.$router.push('players_history');
    }
  }
}
</script>