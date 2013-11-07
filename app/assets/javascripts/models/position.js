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
  // Need to register the skill categories for ember to pick them up, otherwise they aren't included in the has_many
  skillCategories: DS.hasMany("skillCategory"),
  normal_skills: DS.hasMany("skillCategory"),
  double_skills: DS.hasMany("skillCategory")
});