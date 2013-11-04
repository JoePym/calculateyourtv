puts "creating Chaos"
chaos = Roster.create(:name => "Chaos", :reroll_cost => 60, :logo_path => "chaos_logo.png")

puts "adding positionals to Chaos"
beastman = chaos.positions.create(:name => "Beastman",
  :mv => 6, :st => 3, :ag => 3, :av => 8,
  :default_skills => ["Horns"], 
  :normal_skills => ["general", "strength", "mutation"], :double_skills => ["passing", "agility"],
  :cost => 60, :journeyman_position => true, :maximum => 16)
cw = chaos.positions.create(:name => "Chaos Warrior",
  :mv => 5, :st => 4, :ag => 3, :av => 9,
  :normal_skills => ["strength", "mutation", "general"], :double_skills => ["passing", "agility"],
  :default_skills => [], :maximum => 4,:cost => 100)
mino = chaos.positions.create(:name => "Minotaur",
  :mv => 5, :st => 5, :ag => 2, :av => 8, 
  :default_skills => ["Frenzy", "Mighty Blow", "Thick Skull", "Horns", "Loner", "Wild Animal"],
  :normal_skills => ["strength", "mutation"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 150)

puts "Creating sample team"
team = Team.create(:name => "Darkscream Chosen", :tv => 1000, :rerolls => 3)
team.roster = chaos
team.save!
names = ['Bashhunger The Shredder','Droolkill The Dissector','Evilblast The Hungry','Evildrool','Hungermaw The Blade','Sharpspawn','Smashblade The All-devouring','Smashgut','Warstrike The Dissector','Bentspawn','Charmcraze','Hungermouth','Madgut','Snaremouth The Regulator']
4.times do |i|
  team.players.create(:name => names[i], :position => cw, :number => 1+ i)
end
7.times do |i|
  team.players.create(:name => names[i+4], :position => beastman, :number => 5 + i)
end