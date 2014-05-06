class SkillSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object
  attributes :id, :name, :skill_category

  def skill_category
    object.skill_category.id
  end
end
