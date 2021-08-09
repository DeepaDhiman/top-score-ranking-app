# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def search
    @search_result = Player.search_data(params)
  end

  private
  def players_params
    params.require(:player).permit(
      :name,
      :score_before_date,
      :score_after_date
    )
  end
end
