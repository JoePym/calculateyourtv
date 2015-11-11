class Position < ActiveRecord::Base
  has_many :skill_accesses
  has_many :skill_categories, :through => :skill_accesses
  has_and_belongs_to_many :skills

  def normal_skills
    skill_categories.where(:skill_accesses => {:normal => true})
  end

  def double_skills
    skill_categories.where(:skill_accesses => {:normal => false})
  end

  def enhancements
    SkillCategory.where(name: "Enhancements")
  end

  def normal_skills=(arr)
    names = arr.map(&:titlecase)
    categories = SkillCategory.where(:name => names)
    categories.each do |c|
      self.skill_accesses << SkillAccess.new(:skill_category_id => c.id, :normal => true)
    end
  end

  def double_skills=(arr)
    names = arr.map(&:titlecase)
    categories = SkillCategory.where(:name => names)
    categories.each do |c|
      self.skill_accesses << SkillAccess.new(:skill_category_id => c.id, :normal => false)
    end
  end

  def default_skills=(arr)
    self.skills << Skill.where(:name => arr)
  end
end
