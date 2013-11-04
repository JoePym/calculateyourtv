CalculateYourTV.Player = DS.Model.extend({
  name: DS.attr(),
  team: DS.belongsTo("team"),
  position: DS.belongsTo("position"),
  // skills: DS.hasMany("skill"),
  number: DS.attr()
});