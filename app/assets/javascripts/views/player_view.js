CalculateYourTV.PlayerView = Ember.View.extend({
  classNames: 'player-view'.w(),
  templateName: 'rosters/player_view',
  isShowVisible: true,
  isEditVisible: false,
  actions: {
    toggleVisibility: function(){
      this.toggleProperty('isShowVisible');
      this.toggleProperty('isEditVisible');
    }
  }
});