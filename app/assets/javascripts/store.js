// http://emberjs.com/guides/models/defining-a-store/

CalculateYourTV.Store = DS.Store.extend({
  revision: 13
});

DS.RESTAdapter.reopen({
  namespace: 'api/v1'
});