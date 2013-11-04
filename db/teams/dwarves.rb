dwarves = Roster.create(:name => "Dwarves", :reroll_cost => 50, :logo_path => "dwarf_logo.png")

puts "adding positionals to Dwarves"
deathroller = dwarves.positions.create(:name => "Deathroller",
  :mv => 4, :st => 7, :ag => 1, :av => 10, 
  :default_skills => [ "Loner", "Break Tackle", "Dirty Player", "Juggernaut", "No Hands", "Mighty Blow", "Secret Weapon",
   "Stand Firm"],
  :normal_skills => ["strength"], :double_skills => ["agility", "passing", "general"],
  :maximum => 1,:cost => 160, :journeyman_position => false)
troll_slayer = dwarves.positions.create(:name => "Troll Slayer",
  :mv => 5, :st => 3, :ag => 2, :av => 8, 
  :default_skills => ["Block", "Frenzy", "Dauntless", "Thick Skull"],
  :normal_skills => ["general", "strength"], :double_skills => ["agility", "passing"],
  :maximum => 2,:cost => 90, :journeyman_position => false)
runner = dwarves.positions.create(:name => "Runner",
  :mv => 6, :st => 3, :ag => 2, :av => 8, 
  :default_skills => ["Sure Hands", "Thick Skull"],
  :normal_skills => ["general", "passing"], :double_skills => ["agility", "strength"],
  :maximum => 2,:cost => 80, :journeyman_position => false)
blitzer = dwarves.positions.create(:name => "Blitzer",
  :mv => 5, :st => 3, :ag => 3, :av => 9, 
  :default_skills => ["Block", "Thick Skull "],
  :normal_skills => ["general", "strength"], :double_skills => ["agility", "passing"],
  :maximum => 2,:cost => 80, :journeyman_position => false)
longbeard = dwarves.positions.create(:name => "Blocker",
  :mv => 4, :st => 3, :ag => 2, :av => 9, 
  :default_skills => ["Block", "Tackle", "Thick Skull"],
  :normal_skills => ["general", "strength"], :double_skills => ["agility", "passing"],
  :maximum => 16,:cost => 70, :journeyman_position => true)

puts "Creating Dwarf team"
team = Team.create(:name => "Khazad Warhammers", :rerolls => 3, :tv => 1000)
names = [
"Aeni Goblinbreaker",
"Bades Goodshaman",
"Caso Grimlode",
"Celri Spiritslayer",
"Daro Grayblade",
"Hukad Graysmiter",
"Iira Ogreslayer",
"Londi Godstunneler",
"Naric Wraithhunter",
"Rariy Ghoulbattler",
"Taderi Prayercopper",
"Tbibd Gravelsmasher",
"Tek Keysmither",
"Trirr Ironmolder",
"Vucrid Godshunter"
]
team.roster = dwarves
team.save!
5.times do |i|
  team.players.create(:name => names[i], :position => longbeard, :number => i)
end
2.times do |i|
  team.players.create(:name => names[5+i], :position => runner, :number => 6 + i)
end
2.times do |i|
  team.players.create(:name => names[7+i], :position => blitzer, :number => 8 + i)
end
2.times do |i|
  team.players.create(:name => names[9+i], :position => troll_slayer, :number => 10 + i)
end
