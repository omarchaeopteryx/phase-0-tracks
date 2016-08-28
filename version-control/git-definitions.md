# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?

Version control is a way of keeping track of project changes over time. It's useful because if you encounter any bugs, it's possible to "roll back" to an earlier time and start again from a version of the code where there are no bugs, for example. 

* What is a branch and why would you use one?

A branch is a copy of the software's code. It's useful to branch off parts of your project because you or your team can simultaneously work on different features of your software (whether overlapping or stand-alone features) and then merge them back together again. It means you need to also be careful about which branch you are working on at any give time, since it's dangerous to make changes to the "master" branch directly.

* What is a commit? What makes a good commit message?

A commit creates a "save point." It means you're ready to "stage" the changes you've made to your current code and are ready to share it with collaborators or mark it as a point in time to which you may want to return in version control. A good commit message is preferably a short, meaningful message about what was done, and by convention is written in the second person form.

* What is a merge conflict?!?

A merge conflict happens when there are multiple changes to the same portion of a file in different branches or copies deriving from the same original code. When you try to merge branches, git will tell you whether there is a conflict or not and give you a chance to resolve it. 