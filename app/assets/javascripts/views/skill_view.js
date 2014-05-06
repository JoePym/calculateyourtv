CalculateYourTV.SkillView = Ember.View.extend({
  classNames: 'label'.w(),
  classNameBindings: 'labelDefault labelSuccess labelDanger labelPrimary'.w(),
  templateName: 'rosters/skill_view',
  tagName:'span',
  labelSuccess: function(){
  	return this.get('hasSkill');
  }.property('hasSkill'),
  labelDefault: function(){
  	return this.get('hasDefaultSkill');
  }.property('hasDefaultSkill'),
  labelPrimary: function(){
  	return !(this.get('hasSkill') || this.get('hasDefaultSkill'));
  }.property('hasSkill', 'hasDefaultSkill'),
  hasDefaultSkill: function(){
  	return this.get('controller.currentPlayer').hasDefaultSkill(this.get('content'));
  }.property('controller.currentPlayer.hasDefaultSkill'),
  hasSkill: function(){
  	return this.get('controller.currentPlayer').hasSkill(this.get('content'));
  }.property('controller.currentPlayer.skills'),
  click: function(evt) {
    if(this.get('hasDefaultSkill')){
      return false;
    }
  	if(!this.get('hasSkill')){
      if(this.get('controller.currentPlayer.skills').toArray().length < 6){
    	  this.get('controller').send('addSkillToCurrentPlayer', this.get('content'));
      }
    } else {
    	this.get('controller').send('removeSkillFromCurrentPlayer', this.get('content'));
    }
  }
});