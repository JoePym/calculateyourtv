class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :st, :ag, :ma, :av, :cost, :journeyman_position, :normal_skills, :double_skills,
             :roster, :maximum, :enhancements, :is_star_player

  has_many :skills, key: :skills
  has_many :skill_categories, key: :skill_categories
  embed :ids, include: true

  def roster
    object.roster_id
  end

  def normal_skills
    object.normal_skills.map(&:id)
  end

  def double_skills
    object.double_skills.map(&:id)
  end

  def enhancements
    object.enhancements.map(&:id)
  end
end