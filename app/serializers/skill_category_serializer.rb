class SkillCategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :skills, key: :skills
  embed :ids, include: true

end
