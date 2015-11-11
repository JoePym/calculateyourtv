#first load the skills and categories
skill_categories = ["General", "Strength", "Agility", "Mutation", "Passing", "Extraordinary", "Enhancements"];
skills = {
  general:  ["Block", "Dauntless", "Dirty Player", "Fend", "Frenzy", "Kick", "Kick-Off Return",
   "Pass Block", "Pro", "Shadowing", "Strip Ball", "Sure Hands", "Tackle", "Wrestle"],
  strength: ["Break Tackle", "Grab", "Guard", "Juggernaut", "Mighty Blow", "Multiple Block",
   "Piling On", "Stand Firm", "Strong Arm", "Thick Skull"],
  agility:  ["Catch", "Diving Catch", "Diving Tackle", "Dodge", "Jump Up", "Leap", "Side Step",
   "Sneaky Git", "Sprint", "Sure Feet"],
  mutation:  ["Big Hand", "Claw", "Claws", "Disturbing Presence", "Extra Arms", "Foul Appearance",
   "Horns", "Prehensile Tail", "Tentacles", "Two Heads", "Very Long Legs"],
  passing: ["Accurate", "Dump-Off", "Hail Mary Pass", "Leader", "Nerves of Steel", "Pass", "Safe Throw"],
  extraordinary: ["Always Hungry", "Animosity", "Ball & Chain", "Blood Lust", "Bombardier", "Bone-head",
   "Chainsaw", "Decay", "Fan Favourite", "Hypnotic Gaze", "Loner", "No Hands", "Nurgle's Rot", "Really Stupid",
   "Regeneration", "Right Stuff", "Secret Weapon", "Stab", "Stakes", "Stunty", "Take Root", "Throw Team-Mate",
   "Titchy", "Wild Animal"],
  enhancements: ["St", "St", "Ag", "Ag", "Ma", "Ma", "Av", "Av"]
}

skill_categories.map!{|sc| SkillCategory.create(:name => sc)}
skills.map do |cat, skill_set|
  category = SkillCategory.where("name ilike ?", cat).first
  skill_set.each do |skill|
    category.skills << Skill.new(:name => skill)
  end
end




Dir["#{Rails.root}/db/teams/*.rb"].each{|s| load s }
load Rails.root.join('db', "star_players.rb")
