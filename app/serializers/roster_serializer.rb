class RosterSerializer < ActiveModel::Serializer
  #we need the image path to load the logo file for the roster
  include ActionView::Helpers::AssetTagHelper

  attributes :id, :name, :reroll_cost, :logo_path, :allow_apo, :journeyman
  embed :ids, include: true

  has_many :positions, key: :positions
  has_one :team, key: :team

  def logo_path
    "assets" + asset_path(object.logo_path)
  end

  def journeyman
    positions.where(:journeyman_position => true).first.id
  end


end


