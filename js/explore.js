// OM, DBC Week 7.1

// Psudocoding function that takes string as a parameter and then prints out the reverse:

// First, set up a string that you can operate on later:

var my_string = "applesauce";

// Then, create a 'for' loop where i is the length of the string. Then create a counter that goes from that value (the maximum/length) down to zero

// Then take each index item of the letter, and run through them backwards through the contole.log screen

function stringReverse(any_string) {
  for (var i = any_string.length; i>=0; i--) {
  console.log(any_string[i]);
  }
}

// Driver code to test out this function:

stringReverse(my_string)
