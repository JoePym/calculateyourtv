class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position_id, :skills, :team, :number

  def team
    object.team.id
  end
end
