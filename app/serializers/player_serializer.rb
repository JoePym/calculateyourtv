class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :skills, :team, :number

  def team
    object.team.id
  end

  def position
    object.position.id
  end
end
