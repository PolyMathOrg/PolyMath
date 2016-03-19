accessing
sup:aNumber 
|i|
i:=self findLast: [ :int|(aNumber > int sup) or:[int includes: aNumber ]].
(self size - i )timesRepeat: [ self removeLast ].
self isEmpty ifTrue: [ ^nil ].
self last sup:aNumber .
self reSort.
self reduce .
^aNumber 