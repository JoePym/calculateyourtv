class TeamGenerator

  def initialize(team)
    @team = team
    @roster = Roster.find(team.delete(:roster))
    @pdf = Prawn::Document.new(:page_layout => :landscape)
    @stat_green = "#038F03"
  end

  def generate
    @pdf.image "#{Rails.root}/app/assets/images/#{@roster.logo_path}", :at => [0, @pdf.bounds.height], :height => 75
    @pdf.bounding_box([60, @pdf.bounds.height - 15], :width => 300, :height => 75) do
      @pdf.text @team[:name].gsub("+", " "), :size => 27
      @pdf.text "Coached By: #{@team[:coach]}"
    end    
    team_details = [
      ["Team Gold", "#{@team[:gold]}k", "Apothecary", @team[:apo] ? "Yes" : "No"],
      ["Rerolls (#{@roster.reroll_cost.to_i}k):", @team[:rerolls], "Cheerleaders", @team[:cheerleaders]],
      ["Assistant Coaches", @team[:assistant_coaches], "Fan Factor", @team[:fanfactor]]
    ]
    @pdf.bounding_box([410, @pdf.bounds.height - 5], :width => 310, :height => 85) do
      @pdf.table team_details, :column_widths => [125,30,125,30]
    end
    num_col_width = 27
    widths = [num_col_width, 90, 130, num_col_width, num_col_width, num_col_width, num_col_width, 325, 40]
    # headers = [["", "Name", "Position", "Ma", 
    #          "St", "Ag", "Av", "Skills", "Cost"]]
    # player_array = @team[:players].map do |player|
    #   position = Position.find(player.delete(:position))
    #   @plus_st = @plus_ag = @plus_ma = @plus_av = 0
    #   cost =  if (player[:skills] && player.skills.select{|k,v| v['type'] != 'default'}.present?) 
    #             green(player.cost) 
    #           else
    #             player.cost
    #           end
    #   skills = format_skills(player.skills)
    #   [ player.playerNum,
    #     player.name.gsub("+", " "),
    #     position.name.gsub("+", " "),
    #     @plus_ma > 0 ? green(player.ma) : player.ma, 
    #     @plus_st > 0 ? green(player.st) : player.st, 
    #     @plus_ag > 0 ? green(player.ag) : player.ag, 
    #     @plus_av > 0 ? green(player.av) : player.av, 
    #     skills,
    #     cost
    #   ]
   #  # end
  	# @pdf.table(headers + player_array, :row_colors => %w[cccccc ffffff],
   #                                     :column_widths => widths,
   #                                     :header => true,
   #                                     :cell_style => {:inline_format => true, :size => 11})
    @pdf.table([["", "Team Value:", "#{@team[:tv]}k"]], :column_widths => [530, 150, 40], :cell_style => {:inline_format => true, :size => 11})
  end

  def render
    generate
    @pdf.render
  end


  private

  def green(text)
    "<color rgb='#{@stat_green}'>#{text}</color>"
  end

  def format_skills(skills)
    return "" unless skills.present?
    skills.map do |k,v| 
      skill_type, name = v["type"], v["name"]
      name = name.gsub("+", " ")
      case skill_type
      when "normal"
        "<color rgb='#3A87AD'>#{name}</color>"
      when "double"
        "<color rgb='#468847'>#{name}</color>"
      when "ma"
        @plus_ma += 1
        "<color rgb='#F89406'>+#{name.titlecase.strip}</color>"     
      when "av"
        @plus_av += 1
        "<color rgb='#F89406'>+#{name.titlecase.strip}</color>"     
      when "ag"
        @plus_ag += 1
        "<color rgb='#BE06F8'>+#{name.titlecase.strip}</color>"     
      when "st"     
        @plus_st +=1 
        "<color rgb='#953B39'>+#{name.titlecase.strip}</color>"  
      else
        name
      end
    end.join(", ")
  end
end