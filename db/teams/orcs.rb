orcs = Roster.create(:name => "Orcs", :reroll_cost => 60, :logo_path => "orc_logo.png")

puts "adding positionals to Orcs"
troll = orcs.positions.create(:name => "Troll",
  :mv => 4, :st => 5, :ag => 1, :av => 9, 
  :default_skills => ["Loner", "Always Hungry", "Mighty Blow", "Really Stupid", "Regeneration", "Throw Team-Mate"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 110)
bob = orcs.positions.create(:name => "Black Orc Blocker",
  :mv => 4, :st => 4, :ag => 2, :av => 9,
  :default_skills => [], 
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :cost => 80, :journeyman_position => false, :maximum => 4)
blitzer = orcs.positions.create(:name => "Blitzer",
  :mv => 6, :st => 3, :ag => 3, :av => 9,
  :default_skills => ["Block"], 
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :cost => 80, :journeyman_position => false, :maximum => 4)
thrower = orcs.positions.create(:name => "Thrower",
  :mv => 5, :st => 3, :ag => 3, :av => 8,
  :normal_skills => ["general", "passing"], :double_skills => ["strength", "agility"],
  :default_skills => ["Pass, Sure Hands"], :maximum => 2,:cost => 70)
goblin = orcs.positions.create(:name => "Goblin",
  :mv => 6, :st => 2, :ag => 3, :av => 7, 
  :default_skills => ["Dodge", "Right Stuff", "Stunty"],
  :normal_skills => ["agility"], :double_skills => ["strength", "passing", "general"],
  :maximum => 4,:cost => 70)
lineman = orcs.positions.create(:name => "Lineman",
  :mv => 5, :st => 3, :ag => 3, :av => 9, 
  :default_skills => [],
  :normal_skills => ["general"], :double_skills => ["strength", "passing", "agility"],
  :maximum => 16,:cost => 50, :journeyman_position => true)

puts "Creating Orc team"
team = Team.create(:name => "Green 'Eadrippaz", :rerolls => 2, :tv => 990)
names = [
"Bo",
"Gruugdush",
"Vruudish",
"Prirk",
"Vodish",
"Paashnak",
"Gigash",
"Gorbag",
"Kruol",
"Prourk",
"Birz",
]
team.roster = orcs
team.save!
team.players.create(:name => names[0], :position => troll, :number => 1)
4.times do |i|
  team.players.create(:name => names[1+ i], :position => bob, :number => 2+ i)
end
4.times do |i|
  team.players.create(:name => names[5+ i], :position => blitzer, :number => 6+ i)
end
team.players.create(:name => names[9], :position => thrower, :number => 10)
1.times do |i|
  team.players.create(:name => names[10], :position => lineman, :number => 11)
end
