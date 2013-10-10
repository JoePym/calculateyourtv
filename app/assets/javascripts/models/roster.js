RosterCreator.Roster = DS.Model.extend({
  name: DS.attr('string'),
  logoPath: DS.attr('string'),
  rerollCost: DS.attr("integer"),
  allowApothecary: DS.attr("boolean")
});