CalculateYourTV.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('rosters');
  }
});

CalculateYourTV.RostersRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.set('model', this.store.findAll('roster'));
  }
});