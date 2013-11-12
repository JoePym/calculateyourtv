CalculateYourTV.Roster = DS.Model.extend({
  name: DS.attr(),
  logo_path: DS.attr(),
  reroll_cost: DS.attr(),
  allow_apo: DS.attr(),
  team: DS.belongsTo("team"),
  positions: DS.hasMany("position"),
  journeyman: DS.belongsTo("position")
});