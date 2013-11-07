CalculateYourTV.Skill = DS.Model.extend({
  name: DS.attr('string'),
  skill_category: DS.belongsTo("skillCategory")
});