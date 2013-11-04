puts "creating Nurgle"
nurgle = Roster.create(:name => "Nurgle", :reroll_cost => 70, :logo_path => "nurgle_logo.png", :allow_apo => false)

puts "adding positionals to Nurgle"
nw = nurgle.positions.create(:name => "Nurgle Warrior",
  :mv => 4, :st => 4, :ag => 2, :av => 9,
  :normal_skills => ["strength", "mutation", "general"], :double_skills => ["passing", "agility"],
  :default_skills => ["Disturbing Presence", "Foul Appearance", "Nurgle's Rot", "Regeneration"], :maximum => 4,:cost => 110)
bon = nurgle.positions.create(:name => "Beast of Nurgle",
  :mv => 4, :st => 5, :ag => 1, :av => 9, 
  :default_skills => ["Loner", "Disturbing Presence", "Foul Appearance", "Mighty Blow", "Nurgle's Rot", "Really Stupid", "Regeneration", "Tentacles" ],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility", "mutation"],
  :maximum => 1,:cost => 140)
pestigor = nurgle.positions.create(:name => "Pestigor",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Horns", "Nurgle's Rot", "Regeneration"], 
  :normal_skills => ["general", "strength", "mutation"], :double_skills => ["passing", "agility"],
  :cost => 80, :journeyman_position => false, :maximum => 4)
rotter = nurgle.positions.create(:name => "Rotter",
  :mv => 5, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Decay", "Nurgle's Rot"], 
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength", "mutation"],
  :cost => 40, :journeyman_position => true, :maximum => 16)

puts "Creating sample team"
team = Team.create(:name => "Champions of Despair", :tv => 980, :rerolls => 2)
team.roster = nurgle
team.save!
names = 
['Xrathedetsx',
  'Korgon Plaguelord',
  'Rlalth the Rotten',
  'Lord Gorgeth',
  'Mircosien the Bloody',
  'Kord',
  'Pus',
  'Boil',
  'Famine',
  'Lone',
  'Mordred']
team.players.create(:name => names[0], :position => bon, :number => 1)
4.times do |i|
  team.players.create(:name => names[i+1], :position => nw, :number => 2+ i)
end
1.times do |i|
  team.players.create(:name => names[i+5], :position => pestigor, :number => 6+ i)
end
5.times do |i|
  team.players.create(:name => names[i+6], :position => rotter, :number => 7+ i)
end