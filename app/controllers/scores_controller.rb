# frozen_string_literal: true

class ScoresController < ApplicationController

  def destroy
    @score = Score.find params[:id]
    @score.destroy!
    
    head :ok
  end

end
