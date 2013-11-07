CalculateYourTV.Team = DS.Model.extend({
  name: DS.attr(),
  roster: DS.belongsTo("roster"),
  players: DS.hasMany("player"),
  rerolls: DS.attr(),
  assistant_coaches: DS.attr(),
  cheerleaders: DS.attr(),
  apo: DS.attr(),
  fanfactor: DS.attr(),
  gold: DS.attr(),
  tv: function(){
    var sum = 0;
    if(this.get('apo')){sum += 50};
    sum += this.get('rerolls')*this.get('roster.reroll_cost');
    sum += this.get('assistant_coaches')*10;
    sum += this.get('cheerleaders')*10;
    this.get('players').forEach(function(player){
      sum += player.get("cost")
    });
    return sum;
  }.property('apo', 'rerolls', 'roster.reroll_cost', 'assistant_coaches', 'cheerleaders', "players.@each.cost")
});
