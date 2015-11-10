class Api::V1::SkillCategoriesController < ApplicationController

  def index
    skill_categories = SkillCategory.includes(:skills)
    json = cache ['v1', skill_categories] do
      render_to_string json: skill_categories
    end

    render json: json
  end

  def show
    skill_category = SkillCategory.includes(:skills).find(params(:id))
    json = cache ['v1', 'skill_categories', skill_category] do
      render_to_string json: skill_category
    end
    render json: json
  end
end