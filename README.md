# Code Porting Utility

There was a time when I had to convert C++ code to C#. I wrote a utility to assist me in porting basic and common syntaxes and arguments such as cos from C++ to Math.cos in C# or CString to string. This utility was written in C# and WPF. 

In the user interface, you have a few options. You can choose to convert the entire file or just a snippet of code. You'll also need to specific the location of the JSON file that maps C++ to C#. The sample JSON in this repository is limited but anyone can always add as they see fit. Finally, you can use your favorite comparing tool such as Beyond Compare to compare the differences.