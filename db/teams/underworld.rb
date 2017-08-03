underworld = Roster.create(:name => "Underworld", :reroll_cost => 70, :logo_path => "underworld_logo.png")

puts "adding positionals to Underworld"
troll = underworld.positions.create(:name => "Warpstone Troll",
  :ma => 4, :st => 5, :ag => 1, :av => 9,
  :default_skills => ["Loner", "Always Hungry", "Mighty Blow", "Really Stupid", "Regeneration", "Throw Team-Mate"],
  :normal_skills => ["strength", "mutation"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 110)
blitzer = underworld.positions.create(:name => "Skaven Blitzer",
  :ma => 7, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Animosity", "Block"],
  :normal_skills => ["general", "strength", "mutation"], :double_skills => ["passing", "agility"],
  :cost => 90, :journeyman_position => false, :maximum => 2)
thrower = underworld.positions.create(:name => "Skaven Thrower",
  :ma => 7, :st => 3, :ag => 3, :av => 7,
  :normal_skills => ["general", "passing", "mutation"], :double_skills => ["strength", "agility"],
  :default_skills => ["Animosity", "Pass", "Sure Hands"], :maximum => 2,:cost => 70)
lineman = underworld.positions.create(:name => "Skaven Lineman",
  :ma => 7, :st => 3, :ag => 3, :av => 7,
  :default_skills => ["Animosity"],
  :normal_skills => ["general", "mutation"], :double_skills => ["strength", "passing", "agility"],
  :maximum => 2,:cost => 50)
goblin = underworld.positions.create(:name => "Underworld Goblin",
  :ma => 6, :st => 2, :ag => 3, :av => 7,
  :default_skills => ["Dodge", "Stunty", "Right Stuff"],
  :normal_skills => ["agility", "mutation"], :double_skills => ["strength", "passing", "general"],
  :maximum => 16,:cost => 40, :journeyman_position => true)



puts "Creating Underworld team"
team = Team.create(:name => "Lowdown Squeakers", :rerolls => 3, :tv => 980)
names = [
"Darkmaw",
"Vrolg the Hook",
"Vurk",
"Rong",
"Raskk Razorback",
"Rirag the Slayer",
"Bilik",
"Queek",
"Snick",
"Polo",
"Mog",
"Nirk",
"Kik",
"Flox",
"Didda",
"Gnagnag"
]
team.roster = underworld
team.save!
team.players.create(:name => names[0], :position => troll, :number => 1)
2.times do |i|
  team.players.create(:name => names[1+ i], :position => blitzer, :number => 2+ i)
end
2.times do |i|
  team.players.create(:name => names[3+i], :position => thrower, :number => 4 + i)
end
2.times do |i|
  team.players.create(:name => names[5+i], :position => lineman, :number => 6 + i)
end
6.times do |i|
  team.players.create(:name => names[7+i], :position => goblin, :number => 8+ i)
end
