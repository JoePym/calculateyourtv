CalculateYourTV.PlayerView = Ember.View.extend({
  classNames: 'player-view'.w(),
  templateName: 'rosters/player_view',
  isShowVisible: true,
  actions: {
    toggleVisibility: function(){
      this.toggleProperty('isShowVisible');
    },
    removePlayer: function(){
      this.get("controller").send("removePlayer", this.content)
    }
  }
});