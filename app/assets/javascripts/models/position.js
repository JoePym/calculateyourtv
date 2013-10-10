RosterCreator.Position = DS.Model.extend({
  name: DS.attr('string'),
  roster: DS.belongsTo("RosterCreator.Roster"),
  st: DS.attr('integer'),
  ag: DS.attr('integer'),
  ma: DS.attr('integer'),
  av: DS.attr('integer'),
  cost: DS.attr("integer"),
  journeyman: DS.attr("boolean"),
  maximum: DS.attr("integer"),
  baseSkills: DS.hasMany("RosterCreator.Skill"),
  normalSkills: DS.hasMany("RosterCreator.SkillCategory"),
  doubleSkills: DS.hasMany("RosterCreator.SkillCategory")
});