accessing
width
|x|
self isEmpty ifTrue: [ ^Float nan ].
x:=0.
self do: [ :i|x:=x + i width ].
^x