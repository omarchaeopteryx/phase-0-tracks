// OM, DBC, Challenge 7.3

// Goal: Thinking through and writing functions to solve problems

// Release 0: Find the longest phrase in a given list of arrays or phrases

var myArray = ["Arizona", "Azerbaijan", "Alaska", "Antwerp"];
var myArrayB = ["a", "acgt", "acgtcgct", "atat","aa",];
var myArrayC = ["The Rolling Stones", "The Beatles", "Led Zeppelin", "Bob Dylan is the best, bro"];
var myArrayD = ["Ahhhhhhhhh!", "Gadzooks!", "Egad!", "Um."];
// Additional variables for Release 1, equivalence checker
var agentA = {name: 'David', 'age': 36};
var agentB = {name: 'Diana', 'age':36};
var agentC = {name: 'David','age':18};

// console.log(myArray.length);

// Additional variables for Release 2, generating random test data

var myLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
var myNumbers = [1,2,3,4,5,6,7,8,9,10];

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
};


function equivalenceChecker(personA,personB){
		var name1 =  personA.name;
		var name2 = personB.name;
		var age1 = personA.age;
		var age2 = personB.age;
		var result = null;
		if (name1 === name2 || age1 === age2)
		result = true;
    else {
		result = false;
		}
	return result
};

console.log("Your winner is: " + lengthTester(myArray));
console.log("Your winner is: " + lengthTester(myArrayB));
console.log("Your winner is: " + lengthTester(myArrayC));
console.log("Your winner is: " + lengthTester(myArrayD));

// Release 1 update: creating a function that takes two given objects and compares their keys, values to see if there are any matches

console.log("Comparing AgentA, AgentC: " + equivalenceChecker(agentA,agentC));
console.log("Comparing AgentA, AgentB: " + equivalenceChecker(agentA,agentB));
console.log("Comparing AgentB, AgentA: " + equivalenceChecker(agentB,agentA));
console.log("Comparing AgentB, AgentC: " + equivalenceChecker(agentB,agentC));

// Release 2 update: generating random test data

// Learning how to pick a random item from a list:
// var myArray = ["kitties","puppies","duckies","baby turtles","birdies"];
// var rand = myArray[Math.floor(Math.random() * myArray.length)];
// console.log(rand);

// Setting up some sub-functions that can used to make a word in an array of any given length. First, you need to be able to make a word of length 1-10 by generating a number, and then looping through to that random number. Each time you do a step, you also need to pick a letter from 1-26 letters, and save it. In this case, I think it makes sense to make a "blank" array of letters, and then put it together as one "random word" at the end.

function letterPicker(){
	var randomLetter = myLetters[Math.floor(Math.random() * myLetters.length)];
	return randomLetter;
}

function wordMaker(){
	var myLetters = [];
	var myLength = randomNumber();
	function randomNumber(){
	var maxLength = myNumbers[Math.floor(Math.random() * myNumbers.length)];
	return maxLength;
}
	for (var i=0;i<myLength;i++){
		myLetters.push(letterPicker());
	}
	return myLetters.join('');
}

// console.log(wordMaker()); <--Testing

// Now that we've created a way to make a random word (stitching together letters for a randomly generated number of times) that's saved as a string, we have to place each string in a list of items. The user selects the length of the array, so it should go from 0 to the "given number" and create a word each time and store it.

function ArrayMaker(yourlength) {
	var myArray = [];
	for (var i=0;i<yourlength;i++){
		myArray.push(wordMaker());
	}
	return myArray;
}

console.log(ArrayMaker(3)); // <-- Testing
console.log(ArrayMaker(7));
console.log(ArrayMaker(10));
