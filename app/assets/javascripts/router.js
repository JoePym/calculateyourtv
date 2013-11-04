// For more information see: http://emberjs.com/guides/routing/

CalculateYourTV.Router.map(function() {
  this.resource('rosters', function() {
    this.resource('roster', { path: ':roster_id' });
  });
});
