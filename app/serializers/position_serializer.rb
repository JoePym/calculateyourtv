class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :st, :ag, :ma, :av, :cost, :journeyman_position, :normal_skills, :double_skills,
             :roster, :maximum, :default_skills

  def roster
    object.roster_id
  end
end