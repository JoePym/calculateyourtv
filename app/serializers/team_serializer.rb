class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :rerolls, :assistant_coaches, :cheerleaders, :roster_id, :apo, :tv, :fanfactor, :gold
  has_many :players
  embed :ids, include: true
end
