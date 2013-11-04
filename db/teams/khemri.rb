khemri = Roster.create(:name => "Khemri", :reroll_cost => 70, :logo_path => "khemri_logo.png", :allow_apo => false)

puts "adding positionals to High Elves"
tomb_guardian = khemri.positions.create(:name => "Tomb Guardian",
  :mv => 4, :st => 5, :ag => 1, :av => 9,
  :default_skills => ["Decay", "Regeneration"], 
  :normal_skills => ["strength"], :double_skills => ["passing", "general", "agility"],
  :cost => 100, :journeyman_position => false, :maximum => 4)
blitzer = khemri.positions.create(:name => "Blitz-Ra",
  :mv => 6, :st => 3, :ag => 2, :av => 8,
  :default_skills => ["Block", "Regeneration"], 
  :normal_skills => ["general", "strength"], :double_skills => ["strength", "agility"],
  :cost => 90, :journeyman_position => false, :maximum => 4)
thrower = khemri.positions.create(:name => "Thro-Ra",
  :mv => 6, :st => 3, :ag => 2, :av => 7,
  :normal_skills => ["general", "passing"], :double_skills => ["strength", "agility"],
  :default_skills => ["Pass, Sure Hands", "Regeneration"], :maximum => 2,:cost => 70)
skeleton = khemri.positions.create(:name => "Skeleton",
  :mv => 5, :st => 3, :ag => 2, :av => 7, 
  :default_skills => ["Regeneration", "Thick Skull"],
  :normal_skills => ["general"], :double_skills => ["strength", "passing", "agility"],
  :maximum => 16,:cost => 40, :journeyman_position => true)

puts "Creating Khemri team"
team = Team.create(:name => "Sandwall Guardians", :rerolls => 3, :tv => 990)
names = [
"King Omezo",
"Queen Opcem",
"Viceroy Poco",
"General Eyigeme",
"Akiho",
"Isonutu",
"Usozep",
"Uwumho",
"Eqinyezo",
"Eqimutemr",
"Jefepiwa",
"Uyur"
]
team.roster = khemri
team.save!
4.times do |i|
  team.players.create(:name => names[i], :position => tomb_guardian, :number => i+1)
end
2.times do |i|
  team.players.create(:name => names[4+i], :position => blitzer, :number => 5 + i)
end
5.times do |i|
  team.players.create(:name => names[6+i], :position => skeleton, :number => 7 + i)
end  