Regex-part-2-Regex with special characters (^ and $)

to work on this we use the following line and cmds

This is a put asdf
This is a pitasdf


This is a pot asdf
This \s is a pytasdf
This is only pt
Thisisapotasdf


put is ther in this line
thisss
thissss

Thissssss

Thi is a line
this is a one more line


 . * \+ \?
asdfasdfasdfasdfasdf
This    is      tab     line


the cmds are

sed -n '/^put/p' ex
sed -n '/pot/p' ex
sed -n '/$pot/p' ex
sed -n '/pot$/p' ex 
sed -n '/^$/p' ex it will match the empty line
sed '/^$/d' ex --> it will delete the empty line

^ --> it matches the first occurence word
$ --> it matches last ocuurence word.

Regex part-3
( [] () {} )

[] --> Matches any single character in list

{} --> Matches for required number of repetations.
    whenever use {} in sed cmd we need to use this with 
      \{i\}
      \{i,j\}
      \{i,\}  
      Note:(we can use \b to print exact matching should have space after or before mathching word)

() --> This will search for zero or more whole sequence.(group a pattern)
        whenever use () in sed cmd we need to use this with
            ex: put\+ --> look for only put string
                \(put\)\+ --> loo for put or putput or putputput....

example file and run and see following cmds
 
 This is a put asdf
This is a pitasdf


This is a pot asdf
This \s is a pytasdf
This is only pt
Thisisapotasdf


put is ther in this line
Thisss
Thissss

Thissssss

Thi is a line
This is a one more line


 . * \+ \?
asdfasdfasdfasdfasdf
This    is      tab     line

asdfasdfetrwtwt


cmds
----

sed -n '/put/p' ex
sed -n '/p[ouy]t/p' ex
sed -n '/p[a-ch-im-qx-z]t/p' ex
sed -n '/This\{3\}/p' ex
sed -n '/this\{3\}/p' ex
sed -n '/This\{3\}/p' ex
sed -n '/This\{3\}/s/p' ex
sed -n '/This\{3\}\b/p' ex
sed -n '/This\{3,4\}\b/p' ex
sed -n '/This\{3,\}\b/p' ex
sed -n '/asdf/p' ex
sed -n '/asdf\{2\}/p' ex
sed -n '/\(asdf\)\{2\}/p' ex
sed -n '/\(asdf\)\{2\}/p' ex
sed -n '/\(asdf\)\{3\}/p' ex
sed -n '/\b\(asdf\)\+/p' ex
sed -n '/\b\(asdf\)\b/p' ex