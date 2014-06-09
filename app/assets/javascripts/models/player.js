CalculateYourTV.Player = DS.Model.extend({
  name: DS.attr(),
  team: DS.belongsTo("team"),
  position: DS.belongsTo("position"),
  skills: DS.hasMany("skill", {embedded: 'always'}),
  number: DS.attr(),
  st: function(){
    var initialSt = this.get('position.st')
    this.get('skills').forEach(function(skill, index){
      if(skill.get('name') == 'St'){
        initialSt = initialSt + 1
      }
    })
    return initialSt;
  }.property('skills','position.st'),
  ag: function(){
    var initialAg = this.get('position.ag')
    this.get('skills').forEach(function(skill, index){
      if(skill.get('name') == 'Ag'){
        initialAg = initialAg + 1
      }
    })
    return initialAg;
  }.property('skills','position.ag'),
  av: function(){
    var initialAv = this.get('position.av')
    this.get('skills').forEach(function(skill, index){
      if(skill.get('name') == 'Av'){
        initialAv = initialAv + 1
      }
    })
    return initialAv;
  }.property('skills','position.av'),
  ma: function(){
    var initialMa = this.get('position.ma')
    this.get('skills').forEach(function(skill, index){
      if(skill.get('name') == 'Ma'){
        initialMa = initialMa + 1
      }
    })
    return initialMa;
  }.property('skills','position.ma'),
  cost: function(){
    var initialCost = this.get('position.cost');
    player = this;
    this.get('skills').forEach(function(skill, index){
      if (skill.get('name') == "Av" || skill.get('name') == "Ma"){
        initialCost = initialCost + 30;
      }
      if (skill.get('name') == "Ag" ){
        initialCost = initialCost + 40;
      }
      if (skill.get('name') == "St" ){
        initialCost = initialCost + 50;
      }
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
  availableEnhancements: function(){
    return this.get('position.enhancements')
  }.property('position.enhancements'),
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
        present = present || s == skill
      });
    })
    return present;
  },
  hasDefaultSkill: function(skill){
    var present = false
    var player = this
    Ember.A(['position.skills']).forEach(function(group, index){
      player.get(group).toArray().forEach(function(s, i){
        present = present || s == skill
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
      present = (present || s == skill)
    });
    return present;
  },
  hasEnhancement: function(skill){
    var present = false
    var player = this
    this.get('skills').toArray().forEach(function(s, index){
      if(s == skill){
        present = (present || s.get('skill_category').get('name') == "Enhancements");
      }
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
      present = (present || s == skill)
    });
    return present;
  }
});