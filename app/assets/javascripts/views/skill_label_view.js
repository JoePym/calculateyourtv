CalculateYourTV.SkillLabelView = Ember.View.extend({
  classNames: 'label'.w(),
  classNameBindings: 'labelDefault labelSuccess labelDanger labelPrimary'.w(),
  templateName: 'rosters/skill_view',
  tagName:'span',
  player: null,
  labelPrimary: function(){
  	return this.get('hasNormalSkill');
  }.property('hasNormalSkill'),
  labelDefault: function(){
  	return this.get('hasDefaultSkill');
  }.property('hasDefaultSkill'),
  labelSuccess: function(){
  	return this.get('hasDoubleSkill')
  }.property('hasDoubleSkill'),
  hasDoubleSkill: function(){
    return this.get('player').hasDoubleSkill(this.get('content'));
  }.property('player.hasDoubleSkill'),
  hasDefaultSkill: function(){
  	return this.get('player').hasDefaultSkill(this.get('content'));
  }.property('player.hasDefaultSkill'),
  hasNormalSkill: function(){
  	return this.get('player').hasNormalSkill(this.get('content'));
  }.property('player.skills')
});