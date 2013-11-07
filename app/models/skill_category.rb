class SkillCategory < ActiveRecord::Base
  has_many :skills
  has_many :skill_accesses
  has_many :positions, :through => :skill_accesses
end
