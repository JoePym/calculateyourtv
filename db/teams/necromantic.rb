roster = Roster.create(:name => "Necro-mantic", :reroll_cost => 70, :logo_path => "necromantic_logo.png", :allow_apo => false)

puts "adding positionals to Necros"
wolf = roster.positions.create(:name => "Werewolf",
  :mv => 8, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Claw", "Regeneration", "Frenzy"], 
  :normal_skills => ["general", "agility"], :double_skills => ["passing", "strength"],
  :cost => 120, :journeyman_position => false, :maximum => 2)
golem = roster.positions.create(:name => "Flesh Golem",
  :mv => 4, :st => 4, :ag => 2, :av => 9, 
  :default_skills => ["Regeneration", "Stand Firm", "Thick Skull"],
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :maximum => 2,:cost => 110, :journeyman_position => false)
wight = roster.positions.create(:name => "Wight",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :normal_skills => ["strength", "general"], :double_skills => ["passing", "agility"],
  :default_skills => ["Block"], :maximum => 2,:cost => 90)
ghoul = roster.positions.create(:name => "Ghoul",
  :mv => 7, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Dodge"],
  :normal_skills => ["agility", "general"], :double_skills => ["strength", "passing"],
  :maximum => 2,:cost => 70)
zombie = roster.positions.create(:name => "Zombie",
  :mv => 4, :st => 3, :ag => 2, :av => 8, 
  :default_skills => ["Regeneration"],
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength"],
  :maximum => 16,:cost => 40, :journeyman_position => true)

puts "Creating Necromantic team"
team = Team.create(:name => "Graveyard Shamblers", :rerolls => 3, :tv => 1000)
names = [
"Terrorfang",
"Geim",
"Myhle",
"Lord Lucianis",
"Lady Lucianis",
"Archer",
"Gnaw",
"Dast",
"Kale",
"Mord",
"Bile"
]
team.roster = roster
team.save!
1.times do |i|
  team.players.create(:name => names[i], :position => wolf, :number => i+1)
end
2.times do |i|
  team.players.create(:name => names[1+i], :position => golem, :number => 2 + i)
end
2.times do |i|
  team.players.create(:name => names[3+i], :position => wight, :number => 4 + i)
end
1.times do |i|
  team.players.create(:name => names[5+i], :position => ghoul, :number => 6 + i)
end
5.times do |i|
  team.players.create(:name => names[6+i], :position => zombie, :number => 7 + i)
end