dark_elves = Roster.create(:name => "Dark Elves", :reroll_cost => 50, :logo_path => "dark_elf_logo.png")

puts "adding positionals to Dark Elves"
blitzer = dark_elves.positions.create(:name => "Witch Elf",
  :mv => 7, :st => 3, :ag => 4, :av => 7,
  :default_skills => ["Dodge", "Frenzy", "Jump Up"], 
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :cost => 110, :journeyman_position => false, :maximum => 4)
blitzer = dark_elves.positions.create(:name => "Blitzer",
  :mv => 7, :st => 3, :ag => 4, :av => 8,
  :default_skills => ["Block"], 
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :cost => 100, :journeyman_position => false, :maximum => 4)
runner = dark_elves.positions.create(:name => "Runner",
  :mv => 7, :st => 3, :ag => 4, :av => 7,
  :normal_skills => ["agility", "general", "passing"], :double_skills => ["strength"],
  :default_skills => ["Dump-Off"], :maximum => 2,:cost => 80)
assassin = dark_elves.positions.create(:name => "Assassin",
  :mv => 6, :st => 3, :ag => 4, :av => 7, 
  :default_skills => ["Stab", "Shadowing"],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :maximum => 2,:cost => 90)
lineelf = dark_elves.positions.create(:name => "Lineman",
  :mv => 6, :st => 3, :ag => 4, :av => 8, 
  :default_skills => [],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :maximum => 16,:cost => 70, :journeyman_position => true)

puts "Creating DE team"
team = Team.create(:name => "Bleeding Hearts", :rerolls => 2, :tv => 1000)
names = [
"Abalen Poisonclaw",
"Anarar Catvoyager",
"Avele Rainjackal",
"Iriyd Doomwarper",
"Izenyner Shadefighter",
"Karer Dreammage",
"Onaid Deathmaker",
"Oveyok Flameslayer",
"Ralidata Chaosbreak",
"Talarkyb Demonsinger",
"Telsa Rootwarrior",
"Ukenelat Shadowarcher",
"Uzazuri Flameseeker",
"Vonorxat Darkjewel",
"Ynaroraz Mightymagus"
]
team.roster = dark_elves
team.save!
4.times do |i|
  team.players.create(:name => names[i], :position => blitzer, :number => i)
end
1.times do |i|
  team.players.create(:name => names[7+i], :position => runner, :number => 7 + i)
end
6.times do |i|
  team.players.create(:name => names[8+i], :position => lineelf, :number => 8 + i)
end
