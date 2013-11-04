class Team < ActiveRecord::Base
  belongs_to :roster
  has_many :players

  def to_param
    self.roster.name.downcase.gsub(" ", "_")
  end
end
