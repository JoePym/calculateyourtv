class Api::V1::SkillCategoriesController < ApplicationController

  def index
    render json: SkillCategory.includes(:skills)
  end

  def show
    render json: SkillCategory.includes(:skills).find(params[:id])
  end
end