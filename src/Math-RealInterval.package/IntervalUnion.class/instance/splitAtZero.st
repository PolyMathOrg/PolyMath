converting
splitAtZero
|n p|
n:=IntervalUnion new.
p:=IntervalUnion new.
self do:[:ri||s|s:=ri splitAtZero. n addLast:s first. p addLast: s second].
p reSort strongReduce.
n reSort strongReduce.
^Array with: n with: p

