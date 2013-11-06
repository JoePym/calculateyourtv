CalculateYourTV.Position = DS.Model.extend({
  name: DS.attr(),
  roster: DS.belongsTo("roster"),
  st: DS.attr(),
  ag: DS.attr(),
  ma: DS.attr(),
  av: DS.attr(),
  cost: DS.attr(),
  journeyman_position: DS.attr(),
  maximum: DS.attr(),
  // baseSkills: DS.hasMany("skill"),
  // normalSkills: DS.hasMany("skillCategory"),
  // doubleSkills: DS.hasMany("skillCategory")
});