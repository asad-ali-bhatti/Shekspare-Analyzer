As a Shakespeare buff, statistics junkie, and Unix lover, Ben finds himself wanting a command-line tool for analyzing Macbeth.
Write a command-line program that prints the number of lines spoken by each character in the play.

Setup instructions
* Unzip and setup the exercise repository:

```shell
cd analyzing-shakespeare
bin/setup
```

Sample usage/output (using made-up numbers):

```shell
$ ruby macbeth_analyzer.rb
543 Macbeth  
345 Banquo  
220 Duncan  
(etc.)
```

* You can find an XML-encoded version of Macbeth here: http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml.
* Your program should download and parse this file at runtime.
* Your solution should be tested, preferably via TDD. Running your tests should not download the play from the ibiblio.org server.
* Some lines are attributed to a speaker called "ALL". Your program should ignore these.
