high_elves = Roster.create(:name => "High Elves", :reroll_cost => 50, :logo_path => "high_elf_logo.png")

puts "adding positionals to High Elves"
blitzer = high_elves.positions.create(:name => "Blitzer",
  :mv => 7, :st => 3, :ag => 4, :av => 8,
  :default_skills => ["Block"], 
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :cost => 100, :journeyman_position => false, :maximum => 2)
thrower = high_elves.positions.create(:name => "Thrower",
  :mv => 6, :st => 3, :ag => 4, :av => 8,
  :normal_skills => ["agility", "general", "passing"], :double_skills => ["strength"],
  :default_skills => ["Pass", "Safe Throw"], :maximum => 2,:cost => 90)
catcher = high_elves.positions.create(:name => "Catcher",
  :mv => 8, :st => 3, :ag => 4, :av => 7, 
  :default_skills => ["Catch"],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :maximum => 4,:cost => 90)
lineelf = high_elves.positions.create(:name => "Lineman",
  :mv => 6, :st => 3, :ag => 4, :av => 8, 
  :default_skills => [],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :maximum => 16,:cost => 70, :journeyman_position => true)

puts "Creating HE team"
team = Team.create(:name => "White Shields", :rerolls => 2, :tv => 990)
names = [
"Telthor Goldenshield",
"Malkor Swiftwing",
"Amile Brightshock",
"Lantel Winddancer",
"Ulther Whitedragon  ",
"Leonis Swangaze",
"Sar Morraent Lionheart",
"Othello Aegiswall",
"Vamyr Vandrake",
"Tragon Darkspike",
"Naidi Warmhearth",
"Kalten Hawkeye"
]
team.roster = high_elves
team.save!
2.times do |i|
  team.players.create(:name => names[i], :position => blitzer, :number => i+1)
end
1.times do |i|
  team.players.create(:name => names[2+i], :position => thrower, :number => 3 + i)
end
2.times do |i|
  team.players.create(:name => names[3+i], :position => catcher, :number => 4 + i)
end  
6.times do |i|
  team.players.create(:name => names[5+i], :position => lineelf, :number => 6+ i)
end