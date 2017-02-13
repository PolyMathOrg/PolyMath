tests
testPrint
|aStream s|
aStream :=ReadWriteStream with:''.
s:=PMSimpleParameterFunction function:f parameters: #(1 2 3).
s printOn: aStream .
s :=aStream contents .
self assert: ((s beginsWith: 'a PMSimpleParameterFunction')).
self assert: (s includesSubstring: '1').
self assert: (s includesSubstring: ' 2').
self assert: (s includesSubstring: ' 3').
