CalculateYourTV.RostersIndexController = Ember.ArrayController.extend({

});

CalculateYourTV.RostersShowController = Ember.ObjectController.extend({
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
    }
  }
});