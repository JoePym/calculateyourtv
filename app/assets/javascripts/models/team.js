RosterCreator.Team = DS.Model.extend({
  name: DS.attr('string'),
  roster: DS.belongsTo("RosterCreator.Roster"),
  players: DS.hasMany("RosterCreator.Player"),
  rerolls: DS.attr('integer'),
  assistantCoaches: DS.attr("integer"),
  cheerleaders: DS.attr("integer"),
  apothecary: DS.attr("boolean"),
  fanFactor: DS.attr("integer"),
  gold: DS.attr("integer")
});
