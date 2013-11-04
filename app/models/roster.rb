class Roster < ActiveRecord::Base
  has_many :positions
  has_many :teams
end
