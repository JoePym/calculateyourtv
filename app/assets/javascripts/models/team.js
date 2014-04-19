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
  }.property('apo', 'rerolls', 'roster.reroll_cost', 'assistant_coaches', 'cheerleaders', "players.@each.cost"),
  nextPlayerNumber: function(){
    var numbers = this.get('players').map(function(p){return p.get("number")});
    for(var i=0;i<16;i++){
      if(numbers.indexOf(i + 1) == -1){
        return i + 1;
      }
    }
  },
  availablePositions: function(){
    var playerPositions = this.get('players').map(function(p){return p.get("position")});
    var positionCounts = {}
    playerPositions.forEach(function(position){
      if(position){
        var pid = position.get("id")
        if(positionCounts[pid]){
          positionCounts[pid] += 1;
        } else{
          positionCounts[pid] = 1;
        }
      }
    });
    var returnedPositions = []
    this.get('roster').get('positions').forEach(function(position){
      if(positionCounts[position.get('id')] < position.get('maximum')){
        returnedPositions.push(position);
      }
    });
    console.log(returnedPositions)
    return returnedPositions;
  }.property("roster.positions", "players.@each.position", "roster.positions.@each.maximum")
});
