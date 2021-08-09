<template>
  <div class="main-section">
    <div class="back-button">
      <button @click="back" type="button">Back</button>
    </div>

    <form class="search-form">
      <div class="multiselect-width">
        <multiselect v-model="value" tag-placeholder="Add this as new tag" placeholder="Search or add a tag" label="name" track-by="code" :options="getPlayersList" :multiple="true" :taggable="true" @tag="addTag"></multiselect>
      </div>

      <div class="search-container">

        <div class="input-field">
          <input v-model="searchInput.score_before_date" placeholder="dddd-mm-yy">
        </div>

        <div class="input-field">
          <input v-model="searchInput.score_after_date" placeholder="dddd-mm-yy">
        </div>

        <div class="search-button">
          <button @click="searchData" type="button">Search</button>
        </div>
      </div>
    </form>

    <div class="search-result">
      <h3>
        Players Info
      </h3>
      <section>
        <header>
          <div class="col title">Player Name</div>
          <div class="col title">Score</div>
          <div class="col title">Score Time</div>
        </header>
        
        <div class="row" v-for="(player, key) in displayedPlayers" :key="key">
          <div class="col">{{ player.player_name }}</div>
          <div class="col">{{ player.score }}</div>
          <div class="col">{{ player.score_date }}</div>
        </div>

        <nav aria-label="Page navigation example" v-if="displayedPlayers.length > 0">
          <ul class="pagination">
            <li class="page-item">
              <button type="button" class="page-link" v-if="page != 1" @click="page--"> Previous </button>
            </li>
            <li class="page-item">
              <button type="button" class="page-link" v-for="(pageNumber, key) in pages.slice(page-1, page+5)" :key="key" 
                @click="page = pageNumber">
                {{pageNumber}}
              </button>
            </li>
            <li class="page-item">
              <button type="button" @click="page++" v-if="page < pages.length" class="page-link"> Next </button>
            </li>
          </ul>
        </nav>	
      </section>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Multiselect from 'vue-multiselect';
// import Paginate from 'vuejs-paginate'
// Vue.component('paginate', Paginate)

  export default {
    components: { 
      Multiselect,
      // Paginate
    },

    data: function () {
      return {
        searchInput: {
          "name": [],
          "score_before_date": "",
          "score_after_date": ""
        },
        searchResult: null,
        playersList: null,
        value: [],
        parPage: 5,
        currentPage: 1,
        players : [],
        page: 1,
        perPage: 9,
        pages: []
      }
    },

    watch: {
     	players () {
			  this.setPages();
		  }
    },

    computed: {
      displayedPlayers () {
        return this.paginate(this.players);
      },

      // playersInfo() {
      //   if (this.searchResult) {
      //     this.searchResult.map((data, i) => {
      //       data["suffix"] = `#${i}`
      //       this.players.push(data);
      //     });
      //   } else {
      //     return [];
      //   }
      // },

      getPlayersList() {
        const playersList = []

        if(this.playersList) {
          this.playersList.filter(data => {
            playersList.push(
              { name: data.name, code: data.name }
            );
          })
        }

        return playersList;
      }

      // getItems: function() {
      //  let current = this.currentPage * this.parPage;
      //  let start = current - this.parPage;
      // //  return this.items.slice(start, current);
      //  return this.playersInfo.slice(start, current);
      // },

      // getPageCount: function() {
      //   // return Math.ceil(this.items.length / this.parPage);
      //    return Math.ceil(this.playersInfo.length / this.parPage);
      // }
    },

    mounted() {
      this.getPlayers();
    },

    methods: {
      async searchData() {
        if (this.value) {
          this.searchInput.name = this.value.map(data => data["name"]);
        }

        try {
          this.searchResult = [];
          this.players = [];

          const response = await axios.post("http://localhost:3000/search.json", 
            this.searchInput
          );

          this.searchResult = response.data;

          if (this.searchResult) {
            this.searchResult.map((data, i) => {
            data["suffix"] = `#${i}`
              this.players.push(data);
            });
          } else {
            return [];
          }

        } catch (error) {
          console.log(error);
        }
      },

      async getPlayers() {
        try {
          const response = await axios.get("http://localhost:3000/players.json");

          this.playersList = response.data;
          console.log('playersList', this.playersList);
        } catch (error) {
          console.log(error);
        }
      },

      clickCallback: function (pageNum) {
       this.currentPage = Number(pageNum);
      },

      addTag (newTag) {
        const tag = {
          name: newTag,
          code: newTag
        }
        // this.options.push(tag)
        this.value.push(tag)
      },

      back() {
        this.$router.push('/');
      },

      setPages () {
        this.pages = [];
        let numberOfPages = Math.ceil(this.players.length / this.perPage);
        for (let index = 1; index <= numberOfPages; index++) {
          this.pages.push(index);
        }
      },

      paginate (players) {
        let page = this.page;
        let perPage = this.perPage;
        let from = (page * perPage) - perPage;
        let to = (page * perPage);
        return  players.slice(from, to);
      }
    },

    filters: {
      trimWords(value){
        return value.split(" ").splice(0,20).join(" ") + '...';
      }
    }
  }
</script>

<style src="vue-multiselect/dist/vue-multiselect.min.css"></style>
