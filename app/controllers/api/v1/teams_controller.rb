require 'team_generator'

class Api::V1::TeamsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def download
    data = team_params
    players = data.delete(:players)
    data[:roster_id] = data.delete(:roster)
    team = Team.new(data)
    send_data TeamGenerator.new(team_params).render, type: "application/pdf"
  end

  private

  def team_params
    params.require(:team).permit(:name, :rerolls, :assistant_coaches, :cheerleaders, :apo, :fanfactor, :gold,
     :roster, :tv, players: [:name, :cost, :number, :position, :team, skills: [:name, :skill_category]])
  end
end