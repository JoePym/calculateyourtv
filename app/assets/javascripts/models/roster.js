CalculateYourTV.Roster = DS.Model.extend({
  name: DS.attr(),
  logo_path: DS.attr(),
  reroll_cost: DS.attr(),
  allow_apo: DS.attr(),
  teams: DS.hasMany("team"),
  positions: DS.hasMany("position")
});