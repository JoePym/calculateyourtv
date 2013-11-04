puts "creating Slann"
slann = Roster.create(:name => "Slann", :reroll_cost => 50, :logo_path => "slann_logo.png")

puts "adding positionals to Slann"
krox = slann.positions.create(:name => "Kroxigor",
  :mv => 6, :st => 5, :ag => 1, :av => 9, 
  :default_skills => [ "Mighty Blow", "Bone-head", "Thick Skull", "Throw Team-Mate" , "Prehensile Tail"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 140)
blitzer = slann.positions.create(:name => "Blitzer",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :normal_skills => ["general", "strength", "agility"], :double_skills => ["passing"],
  :default_skills => [ "Diving Tackle", "Jump Up", "Leap", "Very Long Legs" ], :maximum => 4,:cost => 110, :journeyman_position => false)
catcher = slann.positions.create(:name => "Catcher",
  :mv => 7, :st => 2, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general"], :double_skills => ["passing", "strength"],
  :default_skills => ["Leap", "Very Long Legs", "Diving Catch" ], :maximum => 4,:cost => 80, :journeyman_position => false)
lineman = slann.positions.create(:name => "Lineman",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :normal_skills => ["general"], :double_skills => ["passing", "strength", "agility"],
  :default_skills => ["Leap", "Very Long Legs" ], :maximum => 16,:cost => 60, :journeyman_position => true)


puts "Creating Slann team"
team = Team.create(:name => "Space Hoppaz", :rerolls => 4, :tv => 1000)
team.roster = slann
team.save!
names =[
"Ichabod",
"Jarrod",
"Hector",
"Gregan",
"Santoes",
"Webby",
"Zucchini",
"Bletch",
"Amphibulus",
"Bufonia",
"Conan"
]
2.times do |i|
  team.players.create(:name => names[i], :position => blitzer, :number => 1 + i)
end
2.times do |i|
  team.players.create(:name => names[i + 2], :position => catcher, :number => 3 + i)
end
7.times do |i|
  team.players.create(:name => names[4+i], :position => lineman, :number => 5+i)
end