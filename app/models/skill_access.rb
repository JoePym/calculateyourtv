class SkillAccess < ActiveRecord::Base
  belongs_to :skill_category
  belongs_to :position
end
