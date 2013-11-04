class Player < ActiveRecord::Base
  serialize :skills

  belongs_to :team
  belongs_to :position

end
