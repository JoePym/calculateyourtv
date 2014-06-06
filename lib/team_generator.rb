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
      ["Team Gold", "#{@team[:gold]}k", "Apothecary", @team[:apo] == "true" ? "Yes" : "No"],
      ["Rerolls (#{@roster.reroll_cost.to_i}k):", @team[:rerolls], "Cheerleaders", @team[:cheerleaders]],
      ["Assistant Coaches", @team[:assistant_coaches], "Fan Factor", @team[:fanfactor]]
    ]
    @pdf.bounding_box([410, @pdf.bounds.height - 5], :width => 310, :height => 85) do
      @pdf.table team_details, :column_widths => [125,30,125,30]
    end
    num_col_width = 27
    widths = [num_col_width, 90, 130, num_col_width, num_col_width, num_col_width, num_col_width, 325, 40]
    headers = [["", "Name", "Position", "Ma", 
             "St", "Ag", "Av", "Skills", "Cost"]]
    player_array = @team[:players].map do |index, player|
      @plus_ma = @plus_av = @plus_ag = @plus_st = 0
      position = Position.find(player.delete(:position))
      skills = format_skills(player[:skills], position)
      cost = player[:cost]
      [ index + 1,
        player[:name],
        position.name,
        position.ma + @plus_ma, 
        position.st + @plus_st, 
        position.ag + @plus_ag,
        position.av + @plus_av,
        skills,
        player[:cost]
      ]
    end
    data = headers + player_array

  	@pdf.table(data, :row_colors => %w[cccccc ffffff],
                                       :column_widths => widths,
                                       :header => true,
                                       :cell_style => {:inline_format => true, :size => 11})
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

  def format_skills(skills, position)
    return "" unless skills.present?
    skills.map do |index, skill|
      name = skill[:name]
      skill_type = name.downcase
      skill_type = "normal" if position.normal_skills.map(&:id).include?(skill[:skill_category].to_i)
      skill_type = "double" if position.double_skills.map(&:id).include?(skill[:skill_category].to_i)
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