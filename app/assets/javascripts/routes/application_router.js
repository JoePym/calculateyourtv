CalculateYourTV.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('rosters');
  }
});

CalculateYourTV.RostersIndexRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('model', this.store.findAll('roster'));
  }
});

CalculateYourTV.RosterRoute = Ember.Route.extend({
  setupController: function(controller, roster) {
    controller.set('model', roster);
  }
});