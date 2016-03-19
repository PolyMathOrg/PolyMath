testing
isNotAdmissibleValue: aValue
|x|
x:=admissibleImage intersection: (block value: aValue).
^x isNumber ifTrue: [ false ] ifFalse: [x isEmpty] 