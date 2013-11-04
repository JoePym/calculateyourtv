puts "creating Ogres"
ogres = Roster.create(:name => "Ogres", :reroll_cost => 70, :logo_path => "ogre_logo.png")

puts "adding positionals to Ogres"
ogre = ogres.positions.create(:name => "Ogre",
  :mv => 5, :st => 5, :ag => 2, :av => 9, 
  :default_skills => ["Bone-head", "Mighty Blow", "Thick Skull", "Throw Team-Mate"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 6,:cost => 140)
snotling = ogres.positions.create(:name => "Snotling",
  :mv => 5, :st => 1, :ag => 3, :av => 5,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Dodge", "Right Stuff", "Side Step", "Stunty", "Titchy" ], :maximum => 16,:cost => 20, :journeyman_position => true)

puts "Creating ogre team"
team = Team.create(:name => "Big Boyz", :rerolls => 4, :tv => 1000)
team.roster = ogres
team.save!
names =[
"Thokk",
"Gradth",
"Kodth",
"Orkantos",
"Zog",
"Dom",
"Log",
"Bod",
"Meep",
"Quad",
"Gon",
"Poth",
"Iki"
]
4.times do |i|
  team.players.create(:name => names[i], :position => ogre, :number => 1 + i)
end
8.times do |i|
  team.players.create(:name => names[5+i], :position => snotling, :number => 6+i)
end
