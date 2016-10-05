var colors = ['Blue', 'Purple', 'Gold', 'Red'];

var name = ['Koda', 'Yoda', 'Eduardo', 'Stella'];

colors.push('Bronze');

name.push('Spirit');

console.log(name);

console.log(colors);

var horse = {};

for (var i = 0; i<colors.length; i++) {
  horse[name[i]] = colors[i]
};

console.log(horse);
