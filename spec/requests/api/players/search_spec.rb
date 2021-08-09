# frozen_string_literal: true
require "rails_helper"

RSpec.describe "GET /search", type: :request do
  context "search" do

    let!(:player) { create(:player, name: "PlayerX") }
    let!(:score1) { create(:score, score: 20, player: player ) }
    let!(:score2) { create(:score, score: 19, time: "2020/11/02", player: player ) }

    let!(:player1) { create(:player, name: "PlayerY") }
    let!(:score3) { create(:score, score: 20, time: "2020/10/01", player: player1 ) }
    let!(:score4) { create(:score, score: 19, time: "2021/11/02", player: player1 ) }

    let!(:player2) { create(:player, name: "PlayerZ") }
    let!(:score5) { create(:score, score: 20, time: "2020/09/01", player: player2 ) }
    let!(:score6) { create(:score, score: 19, time: "2021/11/02", player: player2 ) }

    it "all search parameters are blank" do

      post '/search.json', params: {
        :name => "",
        :score_before_date => "",
        :score_after_date => ""
      }
      
      expect(JSON.parse(response.body).size).to eq(6)
    end

    it "search via players name" do

      post '/search.json', params: {
        :name => ["PlayerX"],
        :score_before_date => "",
        :score_after_date => ""
      }

      expect(JSON.parse(response.body).size).to eq(2)
    end

    it "search via multiple players" do

      post '/search.json', params: {
        :name => ["PlayerX", "PlayerY"],
        :score_before_date => "",
        :score_after_date => ""
      }

      expect(JSON.parse(response.body).size).to eq(4)
    end

    it "search via score_before_date" do

      post '/search.json', params: {
        :name => "",
        :score_before_date => "2020/12/01",
        :score_after_date => ""
      }

      expect(JSON.parse(response.body).size).to eq(4)
    end

    it "search via score_after_date" do

      post '/search.json', params: {
        :name => "",
        :score_before_date => "",
        :score_after_date => "2020/12/01"
      }

      expect(JSON.parse(response.body).size).to eq(3)
    end
  end
end