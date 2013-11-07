class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :skill_category

  def skill_category
    object.skill_category.id
  end
end
