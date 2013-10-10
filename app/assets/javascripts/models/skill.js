RosterCreator.Skill = DS.Model.extend({
  name: DS.attr('string'),
  skillCategory: DS.attr("RosterCreator.SkillCategory")
});