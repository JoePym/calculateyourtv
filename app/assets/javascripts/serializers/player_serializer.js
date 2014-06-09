CalculateYourTV.PlayerSerializer = DS.JSONSerializer.extend({
  serialize: function(record, options) {
    var json = this._super.apply(this, arguments);
    json.cost = record.get('cost');
    return json;
  }
});