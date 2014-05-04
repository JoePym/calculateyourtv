CalculateYourTV.Player = DS.Model.extend({
  name: DS.attr(),
  team: DS.belongsTo("team"),
  position: DS.belongsTo("position"),
  skills: DS.hasMany("skill"),
  number: DS.attr(),
  cost: function(){
    var initialCost = this.get('position.cost');
    player = this;
    this.get('skills').forEach(function(skill, index){
      player.get('normalSkillCategories').toArray().forEach(function(group, index){
        if(group.get('skills').toArray().contains(skill)){
          initialCost = initialCost + 20;
        }
      });
      player.get('doubleSkillCategories').toArray().forEach(function(group, index){
        if(group.get('skills').toArray().contains(skill)){
          initialCost = initialCost + 30;
        }
      });
    }); 
    return initialCost;
  }.property('position.cost', 'skills'),
  normalSkillCategories: function(){
  	return this.get('position.normal_skills')
  }.property('position.normal_skills'),
  doubleSkillCategories: function(){
  	return this.get('position.double_skills')
  }.property('position.double_skills'),
  normalSkillList: function(){
    var list = Ember.A([]);
    var player = this
    Ember.A(['normalSkillCategories']).forEach(function(cat, index){
      player.get(cat).toArray().forEach(function(sc, i){
        sc.get('skills').toArray().forEach(function(s, i){
          list.push(s);
        });
      });
    }); 
    return list;
  }.property('normalSkillCategories'),
  doubleSkillList: function(){
    var list = Ember.A([]);
    var player = this
    Ember.A(['doubleSkillCategories']).forEach(function(cat, index){
      player.get(cat).toArray().forEach(function(sc, i){
        sc.get('skills').toArray().forEach(function(s, i){
          list.push(s);
        });
      });
    }); 
    return list;
  }.property('doubleSkillCategories'),
  addSkill: function(skill){
    this.get('skills').pushObject(skill);
  },
  removeSkill: function(skill){
    this.get('skills').removeObject(skill);
  },
  hasSkill: function(skill){
    var present = false
    var player = this
  	Ember.A(['skills']).forEach(function(group, index){
      player.get(group).toArray().forEach(function(s, i){
        present = present || s.get('name') == skill.get('name')
      });
    })
    return present;
  },
  hasDefaultSkill: function(skill){
    var present = false
    var player = this
    Ember.A(['position.skills']).forEach(function(group, index){
      player.get(group).toArray().forEach(function(s, i){
        present = present || s.get('name') == skill.get('name')
      });
    })
    return present;    
  },
  hasNormalSkill: function(skill){
    if(this.hasDefaultSkill(skill)){
      return false;
    }

    var present = false
    var player = this
    this.get('normalSkillList').toArray().forEach(function(s, index){
      present = present || s.get('name') == skill.get('name')
    });
    return present;
  },
  hasDoubleSkill: function(skill){
    if(this.hasDefaultSkill(skill)){
      return false;
    }
    var present = false
    var player = this
    this.get('doubleSkillList').toArray().forEach(function(s, index){
      present = present || s.get('name') == skill.get('name')
    });
    return present;
  }
});