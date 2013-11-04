class RosterSerializer < ActiveModel::Serializer
  #we need the image path to load the logo file for the roster
  include ActionView::Helpers::AssetTagHelper

  attributes :id, :name, :reroll_cost, :logo_path, :allow_apo
  embed :ids, include: true

  has_many :positions
  has_many :teams

  def logo_path
    "assets" + asset_path(object.logo_path)
  end
end


