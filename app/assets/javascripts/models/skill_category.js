CalculateYourTV.SkillCategory = DS.Model.extend({
  name: DS.attr('string'),
  skills: DS.hasMany("skill")
});