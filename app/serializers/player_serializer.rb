class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position_id, :skills, :team_id, :number
end
