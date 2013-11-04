skaven = Roster.create(:name => "Skaven", :reroll_cost => 60, :logo_path => "skaven_logo.png")

puts "adding positionals to Skaven"
rat_ogre = skaven.positions.create(:name => "Rat Ogre",
  :mv => 6, :st => 5, :ag => 2, :av => 8, 
  :default_skills => ["Loner", "Frenzy", "Mighty Blow", "Prehensile Tail", "Wild Animal"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility", "mutation"],
  :maximum => 1,:cost => 150)
blitzer = skaven.positions.create(:name => "Blitzer",
  :mv => 7, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Block"], 
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility", "mutation"],
  :cost => 90, :journeyman_position => false, :maximum => 2)
thrower = skaven.positions.create(:name => "Thrower",
  :mv => 7, :st => 3, :ag => 3, :av => 7,
  :normal_skills => ["general", "passing"], :double_skills => ["strength", "agility", "mutation"],
  :default_skills => ["Pass", "Sure Hands"], :maximum => 2,:cost => 70)
gutter = skaven.positions.create(:name => "Gutter Runner",
  :mv => 9, :st => 2, :ag => 3, :av => 7, 
  :default_skills => ["Dodge"],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing", "mutation"],
  :maximum => 4,:cost => 80)
lineman = skaven.positions.create(:name => "Lineman",
  :mv => 7, :st => 3, :ag => 3, :av => 7, 
  :default_skills => [],
  :normal_skills => ["general"], :double_skills => ["strength", "passing", "agility", "mutation"],
  :maximum => 16,:cost => 50, :journeyman_position => true)

puts "Creating Skaven team"
team = Team.create(:name => "Underdark Nibblers", :rerolls => 2, :tv => 980, :apo => true)
names = [
"Bonesmasher",
"Bresh",
"Bolck",
"Kalbaz the Infected",
"Zulbag",
"Horat the Crooked",
"Pulo",
"Bolck",
"Bresh",
"Pruk the Brown",
"Zulbag",
"Nagrat",
"Gorzun",
"Nagrat",
"Nirk",
"Shagrax",
"Pruk",
"Takesh"
]
team.roster = skaven
team.save!
team.players.create(:name => names[0], :position => rat_ogre, :number => 1)
2.times do |i|
  team.players.create(:name => names[1+ i], :position => blitzer, :number => 2+ i)
end
2.times do |i|
  team.players.create(:name => names[4+i], :position => gutter, :number => 5 + i)
end
team.players.create(:name => names[6], :position => thrower, :number => 7)
5.times do |i|
  team.players.create(:name => names[7+i], :position => lineman, :number => 8+ i)
end