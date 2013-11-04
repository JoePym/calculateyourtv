class Api::V1::RostersController < ApplicationController

  def index
    render json: Roster.all
  end

  def show
    respond_with Roster.find(params[:id])
  end
end