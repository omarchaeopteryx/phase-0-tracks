window.onload = function() {
    function addRedBorder(event) {
        event.target.style.border = "3px solid red";
    }

    function biggerText(event) {
        event.target.style.fontSize = "xx-large";
    }

    function regularText(event) {
        event.target.style.fontSize = "initial"; // Can be smaller
    }

    var header = document.getElementById("header");
    header.addEventListener("click", addRedBorder);

    var lists = document.getElementsByTagName("li");

    for (var i = 0; i < lists.length; i++) {
        lists[i].addEventListener("mouseenter", biggerText); // mouseover will also apply to children, such as <a> on line 21 of index.html
    }

    for (var i = 0; i < lists.length; i++) {
        lists[i].addEventListener("mouseleave", regularText);
    }

    // Adds new text
    var newText = document.getElementById("list2");
    newText.insertAdjacentHTML("afterend", "<p>Remember who you are...</p>");
}
