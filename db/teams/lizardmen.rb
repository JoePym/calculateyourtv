puts "creating Lizardmen"
lizardmen = Roster.create(:name => "Lizardmen", :reroll_cost => 60, :logo_path => "lizardmen_logo.png")

puts "adding positionals to Lizards"
krox = lizardmen.positions.create(:name => "Kroxigor",
  :ma => 6, :st => 5, :ag => 1, :av => 9,
  :default_skills => [ "Loner", "Bonehead", "Mighty Blow", "Thick Skull", "Prehensile Tail"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 140)
saurus = lizardmen.positions.create(:name => "Saurus",
  :ma => 6, :st => 4, :ag => 1, :av => 9,
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :default_skills => [ ], :maximum => 6,:cost => 80, :journeyman_position => false)
skink = lizardmen.positions.create(:name => "Skink",
  :ma => 8, :st => 2, :ag => 3, :av => 7,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Dodge", "Stunty"], :maximum => 16,:cost => 60, :journeyman_position => true)

puts "Creating Lizardmen team"
team = Team.create(:name => "Serpent's Tongue", :rerolls => 2, :tv => 980)
team.roster = lizardmen
team.save!
names =[
"Conquagar of Xhotl",
"Garchicc",
"Tehegar",
"Tza-otta",
"Mundizlat",
"Ankha-oatl",
"Chicctenq",
"Garkrox",
"Ligoq",
"Litenq",
"Otta-ec",
"Zavaletatl",
"Kroq-Seph",
"Chakax",
"Quetzalex",
"Cacasqa"
]
1.times do |i|
  team.players.create(:name => names[i], :position => krox, :number => 1 + i)
end
6.times do |i|
  team.players.create(:name => names[i + 1], :position => saurus, :number => 2 + i)
end
4.times do |i|
  team.players.create(:name => names[7+i], :position => skink, :number => 8+i)
end
