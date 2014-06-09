CalculateYourTV.TeamSerializer = DS.JSONSerializer.extend({
  serialize: function(record, options) {
    var json = this._super.apply(this, arguments);
    json.tv = record.get('tv');
    return json;
  }
});