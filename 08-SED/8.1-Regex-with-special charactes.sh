What is regex--> Regex is the shortcut for regular expersion

If any expresion uses apattern then that experssion uses a pattern the that experssion is called regex.

What is pattern --> Pattern is string which reperents multiple words.
    ex:
    we have file called example-1.txt
    in that we have some content
    like follows
        put coffe
        tea is in pot
        pot and put
    then if we run bellow cmd 
    sed -n '/p[ou]t/p' file
    it mathes the word put and alos pot .

Function of sed cmd
->viewing file content
->searching
->find and replace
->insertion of deletion

part-1 Regex with special characters

( \s \t . * \t \? and  \ )

\s --> matches for space
\ --> escape character
\t --> matches for tab
. --> Matchjes any character excluding newline
* --> Matches asequence of zero or more instances of matches for the preceding regular expression.
\+ --> As *, but matches one or more.
\? --> as *, but only matches zero or one

to implement the option create file with following content
ex: 'ex'
This is a put asdf
This is a pitasdf
This is a pot asdf
This \s is a pytasdf
This is only pt
Thisisapotasdf
thisss
thissss
Thissssss
Thi is a line
this is a one more line
 . * \+ \?
asdfasdfasdfasdfasdf
This    is      tab     line

#then save and exit and run and see following cmd

sed -n '/\s/p' ex
sed -n '/\\s/p' ex
sed -n '/\t/p' ex
sed -n '/\t/p' ex
sed -n '/put/p' ex
sed -n '/p.t/p' ex
sed -n '/\sp.t/p' ex
sed -n '/p.t/p' ex
sed  '/p.t/p' ex
sed -n '/p.t/p' ex
sed -n '/\sp.t/p' ex
sed -n '/\sp.t\s/p' ex
sed -n '/\./p' ex  
sed -n '/This*/p' ex
sed -n '/This/p' ex
sed -n '/This/+/p' ex
sed -n '/This+/p' ex
sed -n '/This\+/p' ex
sed -n '/This\?/p' ex
sed -n '/This\?\s/p' ex
