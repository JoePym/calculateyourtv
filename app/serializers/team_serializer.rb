class TeamSerializer < ActiveModel::Serializer
  cached
  delegate :cache_key, to: :object
  attributes :id, :name, :rerolls, :assistant_coaches, :cheerleaders, :roster, :apo, :tv, :fanfactor, :gold
  has_many :players, key: :players
  embed :ids, include: true

  def roster
    object.roster_id
  end
end
