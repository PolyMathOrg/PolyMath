private
cycleLength
"returns nil - not zero -, if no cycle exists"
|c|
results ifNil:[^nil].
c:=(results copyFrom: 1 to: results size -1)reversed.
c withIndexDo:[:r :i|(result literalEqual: r) ifTrue:[^i]].
^nil