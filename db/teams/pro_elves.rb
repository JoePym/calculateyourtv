pro_elves = Roster.create(:name => "Pro Elves", :reroll_cost => 50, :logo_path => "pro_elf_logo.png")

puts "adding positionals to Dark Elves"
catcher = pro_elves.positions.create(:name => "Catcher",
  :mv => 8, :st => 3, :ag => 4, :av => 7,
  :default_skills => ["Catch", "Nerves of Steel"], 
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :cost => 100, :journeyman_position => false, :maximum => 4)
blitzer = pro_elves.positions.create(:name => "Blitzer",
  :mv => 7, :st => 3, :ag => 4, :av => 8,
  :default_skills => ["Block", "Side Step"], 
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :cost => 110, :journeyman_position => false, :maximum => 2)
thrower = pro_elves.positions.create(:name => "Thrower",
  :mv => 6, :st => 3, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general", "passing"], :double_skills => ["strength"],
  :default_skills => ["Pass"], :maximum => 2,:cost => 70)
lineelf = pro_elves.positions.create(:name => "Lineman",
  :mv => 6, :st => 3, :ag => 4, :av => 7, 
  :default_skills => [],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :maximum => 16,:cost => 60, :journeyman_position => true)

puts "Creating Pro Elf team"
team = Team.create(:name => "Lost Visiers", :rerolls => 2, :tv => 990)
names = [
"Banelute",
"Battlefish",
"Blackglow",
"Dawnsmile",
"Dewbear",
"Duneflail",
"Leaftooth",
"Madrain",
"Mightysword",
"Seapath",
"Stardash",
"Warglow",
"Wildseed",
"Woodbeak", 
"Warpaw"
]
team.roster = pro_elves
team.save!
2.times do |i|
  team.players.create(:name => names[i], :position => blitzer, :number => i)
end
2.times do |i|
  team.players.create(:name => names[2+i], :position => catcher, :number => 3 + i)
end
7.times do |i|
  team.players.create(:name => names[8+i], :position => lineelf, :number => 8 + i)
end