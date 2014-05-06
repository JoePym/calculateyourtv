class SkillCategorySerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object
  attributes :id, :name
  has_many :skills, key: :skills
  embed :ids, include: true

end
