class Player < ActiveRecord::Base
  serialize :skills
  attr_accessor :cost

  belongs_to :team
  belongs_to :position
  has_and_belongs_to_many :skills

end
