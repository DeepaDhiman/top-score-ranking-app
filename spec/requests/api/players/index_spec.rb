# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /players", type: :request do
  context "players listing" do
    let!(:player) { create(:player) }
    let!(:score) { create(:score, player: player )}
    
    before {get '/players.json'}

    it "get list of players name" do
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end