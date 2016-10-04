// OM, DBC Week 7.1

// Psudocoding function that takes string as a parameter and then prints out the reverse in JavaScript !

// First, set up a string that you can operate on later:

var my_string = "";

// Then, get the length of that string. Its length should be the number of times you go through and print each letter.

// Print out in a line of text, first letter, plus second letter, plus third letter, and so on...

// function stringReverse(any_string) {
//   for (var i = any_string.length; i>=0; i--) {
//   console.log(any_string[i]);
//   }
// }

// Updated! Take the string, take each letter one at a time from the last letter of the word to the first letter of the word...
function stringReverse(any_string) { an_array = [];
  for (var i = any_string.length - 1; i>=0; i--) {
	an_array.push(any_string[i]) // ...Store that letter into a side-list that could be like an array...
  }
  return(an_array.join('')) // Print out the individual pieces of the array, and the word will look like it's been written backwards.
}

// DRIVER CODE to test out this function:

// Creating a reversed word and storing it as a variable:
var my_reversed_word = stringReverse(my_string)

// Adding code for conditional - check if the word is a long word or a short word, and print the result:
if (my_string.length < 10 && my_string.length > 0){
  console.log("You've given a short word. Backwards, it is:");console.log(stringReverse(my_string));
} else if (my_string.length > 10) {
  console.log("You've given a long word. Backwards, it  is:");console.log(stringReverse(my_string));
} else {
  console.log("Try again??") // Else case: what if the word has no length?
}
