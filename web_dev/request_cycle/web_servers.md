<!---Omar Malik--->
<!---DBC, Phase 0, 9.1--->

# Exploring Web Servers

## Research Questions

*What are some of the key design philosophies of the Linux operating system?*

The Linux operating system is, first and foremost, open source. It is designed to be shared and modified by users who are, more often than not, developers or, in the more traditional sense of the term, "hackers." This open model allows a fluid approach to the operating system's development compared to for-profit product-release models. The Linux system, by contrast, is constantly changing and is therefore always being updated with new stable editions.

Part of what makes this possible is the philosophical design element that "users know what they're doing." This descends from the UNIX philosophy of the 1960s from which Linux was derived, which itself aims for a kind of minimalism; every part of the software plays a simple, clear role that can be combined with other functional roles in a modular, extensible, and reusable way.

See more:
* http://docstore.mik.ua/orelly/linux/run/ch01_07.htm
* https://opensource.com/business/14/12/linux-philosophy

*In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?*

A virtual private server (VPS) is a remote operating system on a computer that's distinct from your own. It's a carved-out piece of memory on that remote machine that's dedicated to a remote user and to that user it appears there's a whole dedicated server (i.e., a whole computer system) when actually it's just virtual. There may even be many VPSs running from the same computer hardware!

The advantages to this are dependent on that user's needs. The virtual server grants super user access to the person who created it, and so the user can make the VPS into a "sandbox" in which to experiment and test ideas before deplying them somewhere else. The user can also host a personal website, for example, that's connected live to the Internet.

The VPS service also has the distinct advantage of being relatively *cheap*. This is much more accessible for developers than buying a whole remote server somewhere in the world and operating a test-website on it.

*Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?*

It's considered bad practice to run programs as a root user on a Linux system for both the security of the system and the integrity. Because being connected to the Internet allows for the sending and receiving of information (i.e, code), it is dangerous to run a remote Linux server thus because root allows access to critical files on the system--including their deletion!

On the other side of the coin, one's own unexpected changes in root mode can have lasting effects. You don't need to be hacked to mess up your system files (user error will do)!

Third, the design philosophy of the root user is that it's intended for administrative purposes only. For every day use purposes, a specific user alias should be created.

Overall, keeping these things in mind will be good practice when dealing with remote servers at all.

See:

* http://unix.stackexchange.com/questions/52268/why-is-it-a-bad-idea-to-run-as-root
*

### Find the thing, continued

*What are five Chrome DOM properties to explore because you have a hunch or are curious about what they do?*

Examples seen using Chrome Developer Tools:

* Node.nodeName
* Element.classList
* Element.id
* Element.shadowRoot
* Element.contentEditable
