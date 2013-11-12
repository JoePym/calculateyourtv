class Roster < ActiveRecord::Base
  has_many :positions
  has_one :team
end
