amazons = Roster.find_or_create_by_name("Amazons")
amazons.update_attributes(:reroll_cost => 50, :logo_path => "amazon_logo.png")

puts "adding positionals to Amazons"
blitzer = amazons.positions.create(:name => "Blitzer",
  :mv => 6, :st => 3, :ag => 3, :av => 7,
  :default_skills => ["Block", "Dodge"], 
  :normal_skills => ["general", "strength"], :double_skills => ["passing", "agility"],
  :cost => 90, :journeyman_position => false, :maximum => 4)
catcher = amazons.positions.create(:name => "Catcher",
  :mv => 6, :st => 3, :ag => 3, :av => 7,
  :normal_skills => ["agility", "general"], :double_skills => ["passing", "strength"],
  :default_skills => ["Dodge", "Catch"], :maximum => 2,:cost => 70)
thrower = amazons.positions.create(:name => "Thrower",
  :mv => 6, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Dodge", "Pass"],
  :normal_skills => ["passing", "general"], :double_skills => ["strength", "agility"],
  :maximum => 2,:cost => 70)
linewoman = amazons.positions.create(:name => "Linewoman",
  :mv => 6, :st => 3, :ag => 3, :av => 7, 
  :default_skills => ["Dodge"],
  :normal_skills => ["general"], :double_skills => ["strength", "agility"],
  :maximum => 16,:cost => 50, :journeyman_position => true)

puts "Creating amazon team"
team = Team.create(:name => "Blades of Xixhuan", :rerolls => 3, :tv => 970)
names = ["Imjal", "Jutaai","Anari","Tapuruai","Japjai","Caraoco","Jutacuara","Tapuruica","Araramu","Jutaucu",'Parau','Tauau','Apiiri','Padaucuara','Apiamu','Tamaau']
team.roster = amazons
team.save!
4.times do |i|
  team.players.create(:name => names[i], :position => blitzer, :number => i)
end
2.times do |i|
  team.players.create(:name => names[5+i], :position => catcher, :number => 5 + i)
end
1.times do |i|
  team.players.create(:name => names[7+i], :position => thrower, :number => 7 + i)
end
5.times do |i|
  team.players.create(:name => names[8+i], :position => linewoman, :number => 8 + i)
end
