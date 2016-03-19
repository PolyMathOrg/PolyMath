comparing
hash
^inf=sup ifTrue: [ inf hash ] ifFalse: [ inf hash hashMultiply bitXor: sup hash ]	"isNumber does not work here!"