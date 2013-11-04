class Position < ActiveRecord::Base
  serialize :default_skills
  serialize :normal_skills
  serialize :double_skills


end
