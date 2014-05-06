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
  skills: DS.hasMany("skill"),
  normal_skills: DS.hasMany("skillCategory"),
  double_skills: DS.hasMany("skillCategory"),
  enhancements: DS.hasMany("skillCategory", {async: true})
});