// (function(){
//   var skillCategories = ["General", "Strength", "Agility", "Mutation", "Passing", "Extraordinary"];
//   var skillList = {
//     general:  ["Block", "Dauntless", "Dirty Player", "Fend", "Frenzy", "Kick", "Kick-Off Return",
//      "Pass Block", "Pro", "Shadowing", "Strip Ball", "Sure Hands", "Tackle", "Wrestle"],
//     strength: ["Break Tackle", "Grab", "Guard", "Juggernaut", "Mighty Blow", "Multiple Block",
//      "Piling On", "Stand Firm", "Strong Arm", "Thick Skull"],
//     agility:  ["Catch", "Diving Catch", "Diving Tackle", "Dodge", "Jump Up", "Leap", "Side Step",
//      "Sneaky Git", "Sprint", "Sure Feet"],
//     mutation:  ["Big Hand", "Claw", "Claws", "Disturbing Presence", "Extra Arms", "Foul Appearance",
//      "Horns", "Prehensile Tail", "Tentacles", "Two Heads", "Very Long Legs"],
//     passing: ["Accurate", "Dump-Off", "Hail Mary Pass", "Leader", "Nerves of Steel", "Pass", "Safe Throw"],
//     extraordinary: ["Always Hungry", "Animosity", "Ball & Chain", "Blood Lust", "Bombadier", "Bone-head",
//      "Chainsaw", "Decay", "Fan Favourite", "Hypnotic Gaze", "Loner", "No Hands", "Nurgle's Rot", "Really Stupid",
//      "Regeneration", "Right Stuff", "Secret Weapon", "Stab", "Stakes", "Stunty", "Take Root", "Throw Team-Mate",
//      "Titchy", "Wild Animal"]
//   }
//   CalculateYourTV.Skill.FIXTURES = [];
//   CalculateYourTV.SkillCategory.FIXTURES = [];
//   for(var i = 0; i < skillCategories.length; i++){
//     var cat = CalculateYourTV.SkillCategory.FIXTURES.push({id: i + 1, name: skillCategories[i]});
//     lcName = skillCategories[i].toLowerCase();
//     for(var j = 0; j < skillList[lcName].length; j++){
//       CalculateYourTV.Skill.FIXTURES.push({id: j + 1, skillCategory: i + 1, name: skillList[lcName][j]});
//     }
//   }
// })()