// http://emberjs.com/guides/models/defining-a-store/

Calculateyourtv.Store = DS.Store.extend({
  revision: 11,
  adapter: DS.RESTAdapter.create()
});
