humans = Roster.create(:name => "Humans", :reroll_cost => 50, :logo_path => "human_logo.png")

puts "adding positionals to Humans"
ogre = humans.positions.create(:name => "Ogre",
  :mv => 5, :st => 5, :ag => 2, :av => 9, 
  :default_skills => ["Loner", "Mighty Blow", "Bonehead", "Thick Skull", "Throw Team Mate"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 140)
blitzer = humans.positions.create(:name => "Blitzer",
  :mv => 7, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Block"], 
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :cost => 100, :journeyman_position => false, :maximum => 4)
thrower = humans.positions.create(:name => "Thrower",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :normal_skills => ["general", "passing"], :double_skills => ["strength", "agility"],
  :default_skills => ["Pass", "Sure Hands"], :maximum => 2,:cost => 90)
catcher = humans.positions.create(:name => "Catcher",
  :mv => 8, :st => 2, :ag => 3, :av => 7, 
  :default_skills => ["Catch", "Dodge"],
  :normal_skills => ["general", "agility"], :double_skills => ["strength", "passing"],
  :maximum => 4,:cost => 70)
lineman = humans.positions.create(:name => "Lineman",
  :mv => 6, :st => 3, :ag => 3, :av => 8, 
  :default_skills => [],
  :normal_skills => ["general"], :double_skills => ["strength", "passing", "agility"],
  :maximum => 16,:cost => 50, :journeyman_position => true)

puts "Creating Human team"
team = Team.create(:name => "Altdorf Bluejays", :rerolls => 3, :tv => 970)
names = [
"Kurt",
"Gernot",
"Zacharias Dietmaringen",
"Warmund",
"Fridelinus Heidecker",
"Luppolt Ardlich",
"Steffan Fuchs",
"Meffrid",
"Poppe Jeronymus",
"Anders",
"Heineman Wanner",
"Felkel Lank",
"Wigandus Kant",
"Wenzel Bahrenfahrer",
"Adelmann",
"Sweideger"
]
team.roster = humans
team.save!
team.players.create(:name => names[0], :position => ogre, :number => 1)
4.times do |i|
  team.players.create(:name => names[1+ i], :position => blitzer, :number => 2+ i)
end
1.times do |i|
  team.players.create(:name => names[6+i], :position => thrower, :number => 7 + i)
end
5.times do |i|
  team.players.create(:name => names[7+i], :position => lineman, :number => 8+ i)
end