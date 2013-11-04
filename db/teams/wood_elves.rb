puts "creating Wood Elves"
wood_elves = Roster.create(:name => "Wood Elves", :reroll_cost => 50, :logo_path => "wood_elf_logo.png")

puts "adding positionals to Wood Elves"
tree = wood_elves.positions.create(:name => "Treeman",
  :mv => 2, :st => 6, :ag => 1, :av => 10, 
  :default_skills => ["Loner", "Mighty Blow", "Stand Firm", "Strong Arm", "Take Root", "Thick Skull", "Throw Team-Mate" ],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 120)
wardancer = wood_elves.positions.create(:name => "Wardancer",
  :mv => 8, :st => 3, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general"], :double_skills => ["passing", "strength"],
  :default_skills => ["Block", "Dodge", "Leap" ], :maximum => 2,:cost => 120, :journeyman_position => false)
thrower = wood_elves.positions.create(:name => "Thrower",
  :mv => 7, :st => 3, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general", "passing"], :double_skills => ["strength"],
  :default_skills => ["Pass"], :maximum => 2,:cost => 90, :journeyman_position => false)
catcher = wood_elves.positions.create(:name => "Catcher",
  :mv => 8, :st => 2, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general"], :double_skills => ["passing", "strength"],
  :default_skills => ["Dodge","Catch", "Sprint"], :maximum => 4,:cost => 90, :journeyman_position => false)
lineman = wood_elves.positions.create(:name => "Lineman",
  :mv => 7, :st => 3, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general"], :double_skills => ["passing", "strength"],
  :default_skills => [], :maximum => 16,:cost => 70, :journeyman_position => true)

puts "Creating Wood Elf team"
team = Team.create(:name => "Athel Loren Legends", :rerolls => 2, :tv => 990)
names = [
"Oreurdhron",
"Sidhdasion",
"Uruvion",
"Rainradil",
"Caunmerun",
"Verdil",
"Glenlassnen",
"Suiabund",
"Lairildraug",
"Thocaron",
"Adanion"
]
team.roster = wood_elves
team.save!
2.times do |i|
  team.players.create(:name => names[i], :position => wardancer, :number => i+1)
end
1.times do |i|
  team.players.create(:name => names[2+i], :position => catcher, :number => 3 + i)
end
8.times do |i|
  team.players.create(:name => names[3+i], :position => lineman, :number => 4 + i)
end