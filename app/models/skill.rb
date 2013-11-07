class Skill < ActiveRecord::Base
  belongs_to :skill_category
  has_and_belongs_to_many :players
  has_and_belongs_to_many :positions
end
