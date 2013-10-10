RosterCreator.Player = DS.Model.extend({
  name: DS.attr('string'),
  team: DS.belongsTo("RosterCreator.Team"),
  position: DS.belongsTo("RosterCreator.Position"),
  skills: DS.hasMany("RosterCreator.skills"),
  number: DS.attr('integer'),
  rerollCost: DS.attr("integer"),
  allowApothecary: DS.attr("boolean")
});