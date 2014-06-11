DS.JSONSerializer.reopen({ // or DS.RESTSerializer
  serializeHasMany: function(record, json, relationship) {
    var key = relationship.key,
    hasManyRecords = Ember.get(record, key);
    // Embed hasMany relationship if records exist
    if (hasManyRecords && relationship.options.embedded == 'always') {
      hasManyRecords.forEach(function(item, index){
        json[key] = json[key] || [];
        json[key].push(item.serialize());
      });
    }
    // Fallback to default serialization behavior
    else {
      return this._super(record, json, relationship);
    }
  }
});

Ember.SelectOption.reopen({
  attributeBindings: ['value', 'selected', 'disabled'],

  disabled: function() {
    var content = this.get('content');
    return content.disabled || false;
  }.property('content'),

});

