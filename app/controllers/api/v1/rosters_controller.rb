class Api::V1::RostersController < ApplicationController

  def index
    render json: Roster.includes(teams: :players).includes(:positions)
  end

  def show
    render json: Roster.includes(teams: :players).find(params[:id])
  end
end