zbarcam-scan-exit
=================

A way to scan a data-matrix and exit the program.

I was looking for a way for zbarcam to scan and then exit/close itself.
With help from on-line research and some  Bash scripting knowledge.
I was able to make zbarcam to function to my liking.

The Bash script act as a generic zbarcam scan and close.
  It scans the Data Matrix, Append the result to a file in the same directory the script was run, and Exits.

Note: It works, but the script itself is what kills zbarcam at the end. it's not a function of the program itself.
      It is a dirty workaround. but Hey, it works flawlessly.

I'm hopping zbar-tools developers will introduce such function in the future.
If someone knows of a better way of doing this. Please let me know. Thanks and Enjoy.
