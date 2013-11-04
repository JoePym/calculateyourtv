puts "creating Chaos Pact"
chaos_pact = Roster.create(:name => "Chaos Pact", :reroll_cost => 70, :logo_path => "chaos_pact_logo.png")

puts "adding positionals to Chaos Pact"
mino = chaos_pact.positions.create(:name => "Chaos Minotaur",
  :mv => 5, :st => 5, :ag => 2, :av => 8, 
  :default_skills => ["Loner", "Mighty Blow", "Frenzy", "Thick Skull", "Horns",  "Wild Animal"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility", "mutation"],
  :maximum => 1,:cost => 150)
troll = chaos_pact.positions.create(:name => "Chaos Troll",
  :mv => 4, :st => 5, :ag => 1, :av => 9, 
  :default_skills => ["Loner", "Mighty Blow", "Really Stupid", "Throw Team Mate", "Regeneration"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility", "mutation"],
  :maximum => 1,:cost => 110)
ogre = chaos_pact.positions.create(:name => "Chaos Ogre",
  :mv => 5, :st => 5, :ag => 2, :av => 9, 
  :default_skills => ["Loner", "Mighty Blow", "Bonehead", "Thick Skull", "Throw Team Mate"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility", "mutation"],
  :maximum => 1,:cost => 140)
skaven = chaos_pact.positions.create(:name => "Skaven Renegade",
  :mv => 7, :st => 3, :ag => 3, :av => 7,
  :default_skills => [], 
  :normal_skills => ["general", "mutation"], :double_skills => ["passing", "agility", "strength"],
  :cost => 50, :journeyman_position => false, :maximum => 1)
de = chaos_pact.positions.create(:name => "Dark Elf Renegade",
  :mv => 6, :st => 3, :ag => 4, :av => 8,
  :normal_skills => ["mutation", "general", "agility"], :double_skills => ["passing","strength"],
  :default_skills => [ "Animosity" ], :maximum => 1,:cost => 70)
goblin = chaos_pact.positions.create(:name => "Goblin Renegade",
  :mv => 6, :st => 2, :ag => 3, :av => 7,
  :normal_skills => ["agility", "mutation"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Animosity", "Dodge", "Stunty", "Right Stuff" ], :maximum => 1,:cost => 40)
marauder = chaos_pact.positions.create(:name => "Marauder",
  :mv => 6, :st => 3, :ag => 3, :av => 8, 
  :default_skills => [],
  :normal_skills => ["strength", "mutation", "passing", "general"], :double_skills => ["agility"],
  :maximum => 16,:cost => 50, :journeyman_position => true)

puts "Creating sample team"
team = Team.create(:name => "Wasteland Curse", :rerolls => 2, :tv => 1000)
team.roster = chaos_pact
team.save!
names =[
"Bloodrage",
"Dundell",
"Reekgulf",
"Kweek",
"Ihnyr Longeye",
"Fetid Pirate",
"Six Iron Charms",
"Endless brand",
"Havenbow",
"Nine Evil Princes",
"Breeze of Rubies",
"Sword of the Glaciers"]
team.players.create(:name => names[0], :position => mino, :number => 1)
team.players.create(:name => names[1], :position => ogre, :number => 2)
team.players.create(:name => names[2], :position => troll, :number => 3)
team.players.create(:name => names[3], :position => goblin, :number => 4)
team.players.create(:name => names[4], :position => de, :number => 5)
6.times do |i|
  team.players.create(:name => names[i+5], :position => marauder, :number => 6+ i)
end