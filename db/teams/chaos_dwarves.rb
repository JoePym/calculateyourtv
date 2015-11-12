puts "creating Chaos Dwarves"
chaos_dwarves = Roster.create(:name => "Chaos Dwarves", :reroll_cost => 70, :logo_path => "chaos_dwarf_logo.png")

puts "adding positionals to Chaos Dwarves"
hob = chaos_dwarves.positions.create(:name => "Hobgoblin",
  :ma => 6, :st => 3, :ag => 3, :av => 7,
  :default_skills => [],
  :normal_skills => ["general"], :double_skills => ["passing", "agility", "strength"],
  :cost => 40, :journeyman_position => true, :maximum => 16)
cd = chaos_dwarves.positions.create(:name => "Chaos Dwarf Blocker",
  :ma => 4, :st => 3, :ag => 2, :av => 9,
  :normal_skills => ["strength", "general"], :double_skills => ["passing", "agility", "mutation"],
  :default_skills => [ "Block", "Tackle", "Thick Skull" ], :maximum => 6,:cost => 70)
bull = chaos_dwarves.positions.create(:name => "Bull Centaur",
  :ma => 6, :st => 4, :ag => 2, :av => 9,
  :normal_skills => ["strength", "general"], :double_skills => ["passing", "agility", "mutation"],
  :default_skills => ["Sprint", "Sure Feet", "Thick Skull" ], :maximum => 2,:cost => 130)
mino = chaos_dwarves.positions.create(:name => "Minotaur",
  :ma => 5, :st => 5, :ag => 2, :av => 8,
  :default_skills => ["Frenzy", "Mighty Blow", "Thick Skull", "Horns", "Loner", "Wild Animal"],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility", "mutation"],
  :maximum => 1,:cost => 150)

puts "Creating sample team"
team = Team.create(:name => "Magma Born", :rerolls => 3, :tv => 980)
team.roster = chaos_dwarves
team.save!
names =[
"Neccalli the Damned",
"Yaotl Bloodrage",
"Zharth Ironbeard",
"Fhakk Darkhead",
"Kharzhakh Lighthammer",
"Thargrakka Burnface",
"Khanahk Metaltears",
"Zukkor Terrorfist",
"Konk",
"Bolg",
"Delk",
"Gokk",
"Ronn",
"Bulgor",
"Flonk",
"Gromm",
]
#team.players.create(:name => names[0], :position => mino, :number => 1)
2.times do |i|
  team.players.create(:name => names[i], :position => bull, :number => 1+ i)
end
5.times do |i|
  team.players.create(:name => names[2+ i], :position => cd, :number => 3+ i)
end
4.times do |i|
  team.players.create(:name => names[7+ i], :position => hob, :number => 8+ i)
end
