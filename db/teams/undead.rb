roster = Roster.create(:name => "Undead", :reroll_cost => 70, :logo_path => "undead_logo.png", :allow_apo => false)

puts "adding positionals to Undead"
mummy = roster.positions.create(:name => "Mummy",
  :mv => 3, :st => 5, :ag => 1, :av => 9, 
  :default_skills => ["Regeneration", "Mighty Blow"],
  :normal_skills => ["strength"], :double_skills => ["passing", "agility", "general"],
  :maximum => 2,:cost => 120, :journeyman_position => false)
wight = roster.positions.create(:name => "Wight",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :normal_skills => ["strength", "general"], :double_skills => ["passing", "agility"],
  :default_skills => ["Block"], :maximum => 2,:cost => 90)
ghoul = roster.positions.create(:name => "Ghoul",
  :mv => 7, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Dodge"],
  :normal_skills => ["agility", "general"], :double_skills => ["strength", "passing"],
  :maximum => 4,:cost => 70)
skeleton = roster.positions.create(:name => "Skeleton",
  :mv => 5, :st => 3, :ag => 2, :av => 7, 
  :default_skills => ["Regeneration", "Thick Skull"],
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength"],
  :maximum => 16,:cost => 40, :journeyman_position => false)
zombie = roster.positions.create(:name => "Zombie",
  :mv => 4, :st => 3, :ag => 2, :av => 8, 
  :default_skills => ["Regeneration"],
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength"],
  :maximum => 16,:cost => 40, :journeyman_position => true)

puts "Creating Undead team"
team = Team.create(:name => "Terrors of the Night", :rerolls => 3, :tv => 970)
names = [
"King Hutmuwaz",
"Queen Efojeyic",
"Lord Morden",
"Lady Morden",
"Wraith",
"Hunger",
"Kirsten",
"Liebink",
"Gregor",
"Otfried",
"Petschel"
]
team.roster = roster
team.save!
2.times do |i|
  team.players.create(:name => names[i], :position => mummy, :number => i+1)
end
2.times do |i|
  team.players.create(:name => names[2+i], :position => wight, :number => 3 + i)
end
2.times do |i|
  team.players.create(:name => names[4+i], :position => ghoul, :number => 5 + i)
end
5.times do |i|
  team.players.create(:name => names[6+i], :position => zombie, :number => 7 + i)
end