CalculateYourTV.PlayerChangeDropdownView = Ember.View.extend({
  classNames: 'player-view'.w(),
  templateName: 'rosters/player_change_dropdown',
  tagName:'option',
  attributeBindings: ['value', 'label', 'disabled'],
  value: function(){
    return this.content.get('id');
  }.property('value'),
  label: function(){
    return this.content.get('name');
  }.property('label'),
  disabled: function(){
    return this.get('player').get('position') == this.get('content');
  }.property('disabled')

});