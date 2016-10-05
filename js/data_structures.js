// Challenge 7.2, Justin Steensma & Omar Malik

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

// Goal: create a few cars with a constructor function

// It should have a few properties, data types, and one function

function Cars(color,efficiency,model) {
  console.log("About our car:",this);
  this.color = color;
  this.efficiency = efficiency;
  this.model = model;
  this.zoom = function() { console.log("VrrooooOoOOoooom!"); };
  console.log("Car completed.");
}

// Making some cars
var carA = new Cars("green",60,"city");
var carB = new Cars("blue",15,"truck");
var carC = new Cars("red",14,"sports");

// Printing some cars to console
console.log(carA);
console.log(carB);
console.log(carC);

// Trying some functions
carA.zoom();
carB.zoom();
carC.zoom();
