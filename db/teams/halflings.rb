puts "creating Halflings"
halflings = Roster.create(:name => "Halflings", :reroll_cost => 60, :logo_path => "halfling_logo.png")

puts "adding positionals to Halflings"
tree = halflings.positions.create(:name => "Treeman",
  :mv => 2, :st => 6, :ag => 1, :av => 10, 
  :default_skills => [ "Mighty Blow", "Stand Firm", "Strong Arm", "Take Root", "Thick Skull", "Throw Team-Mate" ],
  :normal_skills => ["strength"], :double_skills => ["general", "passing", "agility"],
  :maximum => 1,:cost => 120)
halfling = halflings.positions.create(:name => "Halfling",
  :mv => 5, :st => 2, :ag => 3, :av => 6,
  :normal_skills => ["agility"], :double_skills => ["passing", "general", "strength"],
  :default_skills => ["Dodge", "Stunty", "Right Stuff" ], :maximum => 16,:cost => 30, :journeyman_position => true)

puts "Creating halfling team"
team = Team.create(:name => "Mootland Pie-eaters", :rerolls => 4, :tv => 870)
team.roster = halflings
team.save!
names =[
"Wisemoss",
"Madbriar",
"EereReen",
"Deree",
"Galan YonYon",
"Ped",
"DalReen",
"Rill",
"Chen",
"PenelPed",
"Arv",
"Bren",
"LiYon",
"KalWort Pery",
"Thea",
"Essel",
"CalDair"
]
2.times do |i|
  team.players.create(:name => names[i], :position => tree, :number => 1 + i)
end
12.times do |i|
  team.players.create(:name => names[2+i], :position => halfling, :number => 3+i)
end