star_players = [
  {:name => "Barik Farblast", :ma => 6, :st => 3, :ag => 3, :av => 8,
    :default_skills => ["Loner", "Hail Mary Pass", "Pass", "Secret Weapon", "Strong Arm", "Sure Hands", "Thick Skull"],
    :normal_skills => [], :double_skills => [],
    :cost => 60, :journeyman_position => false, :maximum => 1, :teams => ["Dwarf"]
  },
  {:name => "Barik Farblast 3", :ma => 6, :st => 3, :ag => 3, :av => 8,
    :default_skills => ["Loner", "Hail Mary Pass", "Pass", "Secret Weapon", "Strong Arm", "Sure Hands", "Thick Skull"],
    :normal_skills => [], :double_skills => [],
    :cost => 60, :journeyman_position => false, :maximum => 1, :teams => ["Skaven" "Chaos"]
  },
]

star_players.each do |player|
  Roster.where(name: player.delete(:teams)).each do |team|
    team.positions.create(player)
  end
end