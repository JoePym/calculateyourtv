puts "creating Goblin"
goblins = Roster.create(:name => "Goblin", :reroll_cost => 60, :logo_path => "goblin_logo.png")

puts "adding positionals to Goblins"
troll = goblins.positions.create(:name => "Troll",
  :mv => 4, :st => 5, :ag => 1, :av => 9,
  :default_skills => ["Loner", "Mighty Blow", "Really Stupid", "Throw Team Mate", "Regeneration"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 110)
fanatic = goblins.positions.create(:name => "Fanatic",
  :mv => 3, :st => 7, :ag => 3, :av => 7,
  :normal_skills => ["strength"], :double_skills => ["passing", "general", "agility"],
  :default_skills => ["Ball & Chain", "No Hands", "Secret Weapon", "Stunty" ], :maximum => 1,:cost => 70)
pogo = goblins.positions.create(:name => "Pogoer",
  :mv => 7, :st => 2, :ag => 3, :av => 7,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Dodge", "Stunty", "Very Long Legs", "Leap" ], :maximum => 1,:cost => 70, :journeyman_position => false)
saw = goblins.positions.create(:name => "Looney",
  :mv => 6, :st => 2, :ag => 3, :av => 7,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Chainsaw", "Stunty", "Secret Weapon" ], :maximum => 1,:cost => 40, :journeyman_position => false)
bombadier = goblins.positions.create(:name => "Bombardier",
  :mv => 6, :st => 2, :ag => 3, :av => 7,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Bombardier", "Dodge", "Stunty", "Right Stuff" ], :maximum => 1,:cost => 40, :journeyman_position => false)
goblin = goblins.positions.create(:name => "Goblin",
  :mv => 6, :st => 2, :ag => 3, :av => 7,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Dodge", "Stunty", "Right Stuff" ], :maximum => 16,:cost => 40, :journeyman_position => true)

puts "Creating goblin team"
team = Team.create(:name => "Dirty Gitz", :rerolls => 4, :tv => 1000)
team.roster = goblins
team.save!
names =[
"Krakroth",
"Dokdok",
"Boz Metalghost",
"Demurg Darkstealer",
"Gekatb Giantbane",
"Gneb Bigburner",
"Gotb Giantclaw",
"Gruseb Sickhowl",
"Kur Metalfilth",
"Mxenab Darkthief",
"Nratg Greatshred",
"Rox Dreadjeer",
"Sbag Evildweller",
"Xdezg Metaldoom",
"Xes Giantbone",
"Zat Bigclaw",
"Zutads Giantshade"
]
2.times do |i|
  team.players.create(:name => names[i], :position => troll, :number => 1 + i)
end
team.players.create(:name => names[2], :position => fanatic, :number => 3)
team.players.create(:name => names[3], :position => saw, :number => 4)
team.players.create(:name => names[4], :position => bombadier, :number => 5)
team.players.create(:name => names[5], :position => pogo, :number => 6)
8.times do |i|
  team.players.create(:name => names[6+i], :position => goblin, :number => 7+i)
end
