class Player < ApplicationRecord
  has_many :scores, dependent: :destroy

  def self.search_data(params)
    search_result = Player.joins(:scores).references(:scores)
    search_result = search_result.where(
      name: params[:name]
    ) if params[:name].present?

    search_result = search_result.where(
      "scores.time <= ?", params[:score_before_date]
    ) if params[:score_before_date].present?

    search_result = search_result.where(
      "scores.time >= ?", params[:score_after_date]
    ) if params[:score_after_date].present?
    
    search_result = search_result.select('players.*, scores.*')
   
    search_result
  end
end
