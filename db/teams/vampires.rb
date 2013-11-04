puts "creating Vampires"
vampires = Roster.create(:name => "Vampires", :reroll_cost => 70, :logo_path => "vampire_logo.png")

puts "adding positionals to Vampires"
vampire = vampires.positions.create(:name => "Vampire",
  :mv => 6, :st => 4, :ag => 4, :av => 8, 
  :default_skills => ["Regeneration", "Hypnotic Gaze", "Blood Lust"],
  :normal_skills => ["strength", "general", "agility"], :double_skills => ["passing"],
  :maximum => 6,:cost => 110)
thrall = vampires.positions.create(:name => "Thrall",
  :mv => 6, :st => 3, :ag => 3, :av => 7,
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength"],
  :default_skills => [ ], :maximum => 16,:cost => 40, :journeyman_position => true)

puts "Creating Vampire team"
team = Team.create(:name => "Sylvania Strikers", :rerolls => 4, :tv => 1000)
team.roster = vampires
team.save!
names =[
"Beauchaud",
"Dufoix",
"Lavalliere",
"Audiard",
"Oldric",
"Sigisberht",
"Karolus",
"Frederich",
"Libniko",
"Ramung",
"Philipps",
"Sigric", 
"Gerunch"
]
4.times do |i|
  team.players.create(:name => names[i], :position => vampire, :number => 1 + i)
end
7.times do |i|
  team.players.create(:name => names[6+i], :position => thrall, :number => 7+i)
end