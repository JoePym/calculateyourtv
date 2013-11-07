CalculateYourTV.Player = DS.Model.extend({
  name: DS.attr(),
  team: DS.belongsTo("team"),
  position: DS.belongsTo("position"),
  // skills: DS.hasMany("skill"),
  number: DS.attr(),
  cost: function(){
    return this.get('position.cost');
  }.property('position.cost')
});