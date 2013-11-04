CalculateYourTV.Roster = DS.Model.extend({
  name: DS.attr(),
  logoPath: DS.attr(),
  rerollCost: DS.attr(),
  allowApothecary: DS.attr(),
  teams: DS.hasMany("team"),
  positions: DS.hasMany("position")
});