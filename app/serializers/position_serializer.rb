class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :st, :ag, :mv, :av, :cost, :journeyman_position, :normal_skills, :double_skills,
             :roster_id, :maximum, :default_skills
end