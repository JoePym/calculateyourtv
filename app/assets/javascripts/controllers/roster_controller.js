CalculateYourTV.RostersIndexController = Ember.ArrayController.extend({

});

CalculateYourTV.RostersShowController = Ember.ObjectController.extend({
  currentPlayer: null,
  skillSelectVisible: false,
  actions:{
    removePlayer: function(player){
      var roster = this.get("model")
      var team = roster.get('team')
      team.get("players").removeObject(player);
      player.deleteRecord();
    },
    addPlayer: function(){
      var roster = this.get("model");
      var team = roster.get('team');
      if(team.get('players').get('length') > 15){
        return false;
      }
      var player = this.store.createRecord("player", {name: "Rookie",number: team.nextPlayerNumber()} );
      player.set("team", team);
      team.get('players').pushObject(player);
      player.set("position", roster.get("journeyman"));
    },
    chooseSkillDialogue: function(player){
      this.set('currentPlayer', player);
      this.set('skillSelectVisible', true);
    },
    addSkillToCurrentPlayer: function(skill){
      this.get('currentPlayer').addSkill(skill);
      this.get('currentPlayer').notifyPropertyChange('skills');
    },
    removeSkillFromCurrentPlayer: function(skill){
      this.get('currentPlayer').removeSkill(skill);
      this.get('currentPlayer').notifyPropertyChange('skills');
    }
  }
});