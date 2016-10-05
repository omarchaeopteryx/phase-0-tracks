// OM, DBC, Challenge 7.3

// Goal: Thinking through and writing functions to solve problems

// Release 0: Find the longest phrase in a given list of arrays or phrases

var myArray = ["Arizona", "Azerbaijan", "Alaska", "Antwerp"];

// console.log(myArray.length);

// Create a function that takes the first item in an array and remembers that variable as myHand, as in "what's in my hand?"
function lengthTester(anArray){
	var myHand = anArray[0];
  // Then, we go one by one, moving from one item to the next through the whole array.
  for (var i=1; i<(anArray.length);i++){
  	var equalizer = [];
  // At each step, we compare what we are holding in our hand to what is being presented to us. Is the new item bigger or smaller than what I have (in terms or bigger value of length, or smaller value of length)?
  // If it's bigger, take it into my hand. If it's smaller, keep what I have and move on...
	if (myHand.length > anArray[i].length) {
		myHand = myHand;
		} else if (myHand.length < anArray[i].length){
		myHand = anArray[i];
		}	else {myHand = myHand;
		equalizer.push("*Noted other case*");console.log(equalizer);} // (Adding exception case  for when the lengths are the same... flag to console and keep what you have.)
	}
	return myHand; // ...By the end of the array, what do I have left? That is what's in my hand.
}
console.log("Your winner is: " + lengthTester(myArray));
