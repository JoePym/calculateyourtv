class RosterSerializer < ActiveModel::Serializer
  attributes :id, :name, :reroll_cost, :logo_path, :allow_apo
  embed :ids, include: true

  has_many :positions
  has_many :teams
end


