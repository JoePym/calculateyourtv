class Api::V1::RostersController < ApplicationController

  def index
    rosters = Roster.includes(team: :players).includes(:positions)
    json = cache ['v1', rosters] do
      render_to_string json: rosters
    end
    render json: rosters
  end

  def show
    roster = Roster.includes(team: :players).includes(:positions).find(params[:id])
    json = cache ['v1', "rosters", roster] do
      render_to_string json: roster
    e
    render json: json
  end

end