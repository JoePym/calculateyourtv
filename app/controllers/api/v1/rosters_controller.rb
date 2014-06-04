class Api::V1::RostersController < ApplicationController

  def index
    render json: Roster.includes(team: :players).includes(:positions)
  end

  def show
    render json: Roster.includes(team: :players).find(params[:id])
  end

  def download
  end
end