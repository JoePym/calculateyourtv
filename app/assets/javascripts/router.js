// For more information see: http://emberjs.com/guides/routing/

CalculateYourTV.Router.map(function() {
  this.resource('rosters', function() {
    this.route('show', { path: ':roster_id' });
  });
});
