class AddingSensibleNumberDefaults < ActiveRecord::Migration
  def change
    Team.where(:assistant_coaches => nil).update_all(:assistant_coaches => 0)
    Team.where(:cheerleaders => nil).update_all(:cheerleaders => 0)
    Team.where(:fanfactor => nil).update_all(:fanfactor => 0)
    Team.where(:gold => nil).update_all(:gold => 0)
    change_column_default :teams, :assistant_coaches, 0
    change_column_default :teams, :cheerleaders, 0
    change_column_default :teams, :fanfactor, 0
    change_column_default :teams, :gold, 0
  end
end
