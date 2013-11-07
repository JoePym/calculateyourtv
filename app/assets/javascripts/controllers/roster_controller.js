CalculateYourTV.RostersIndexController = Ember.ArrayController.extend({

});

CalculateYourTV.RostersShowController = Ember.ObjectController.extend({
  actions:{
    removePlayer: function(player){
      player.deleteRecord();
    }
  }
});