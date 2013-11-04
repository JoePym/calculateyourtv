roster = Roster.create(:name => "Norse", :reroll_cost => 50, :logo_path => "norse_logo.png")

puts "adding positionals to Norse"
troll = roster.positions.create(:name => "Snow Troll",
  :mv => 5, :st => 5, :ag => 2, :av => 8, 
  :default_skills => ["Loner", "Claw", "Disturbing Presence", "Frenzy", 'Wild Animal' ],
  :normal_skills => ["strength"], :double_skills => ["passing", "agility", "general"],
  :maximum => 1,:cost => 140, :journeyman_position => false)
ulf = roster.positions.create(:name => "Ulfwerener",
  :mv => 6, :st => 4, :ag => 2, :av => 8,
  :default_skills => ["Frenzy"], 
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :cost => 110, :journeyman_position => false, :maximum => 2)
blitzer = roster.positions.create(:name => "Blitzer",
  :mv => 6, :st => 3, :ag => 3, :av => 7,
  :normal_skills => ["strength", "general"], :double_skills => ["passing", "agility"],
  :default_skills => ["Block", "Frenzy", "Jump Up"], :maximum => 2,:cost => 90)
thrower = roster.positions.create(:name => "Thrower",
  :mv => 6, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Block", "Pass"],
  :normal_skills => ["passing", "general"], :double_skills => ["strength", "agility"],
  :maximum => 2,:cost => 70)
catcher = roster.positions.create(:name => "Runner",
  :mv => 7, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Block", "Dauntless"],
  :normal_skills => ["agility", "general"], :double_skills => ["strength", "passing"],
  :maximum => 2,:cost => 90)
lineman = roster.positions.create(:name => "Lineman",
  :mv => 6, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Block"],
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength"],
  :maximum => 16,:cost => 50, :journeyman_position => true)

puts "Creating Norse team"
team = Team.create(:name => "Icehome Seadragons", :rerolls => 3, :tv => 970)
names = [
"Havelock",
"Gunnar",
"Mani",
"Erp",
"Fell",
"Stein",
"Trygg",
"Brede",
"Ugbjorn",
"Valgard",
"Thorolf",
"Ingemur",
"Oskar",
"Njall",
"Ganger"
]
team.roster = roster
team.save!
2.times do |i|
  team.players.create(:name => names[i], :position => ulf, :number => i+1)
end
2.times do |i|
  team.players.create(:name => names[2+i], :position => blitzer, :number => 3 + i)
end
1.times do |i|
  team.players.create(:name => names[4+i], :position =>catcher, :number => 5 + i)
end
6.times do |i|
  team.players.create(:name => names[5+i], :position => lineman, :number => 6 + i)
end
