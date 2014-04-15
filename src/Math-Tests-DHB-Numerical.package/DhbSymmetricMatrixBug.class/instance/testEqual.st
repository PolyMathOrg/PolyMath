tests
testEqual
"= should work like in a SequenceableCollection  eg a DhbVector and a Array can be equal"
|a b|
a:=DhbMatrix rows: #((2 2 3)(2 4 5)(3 5 6)).
b:=a asSymmetricMatrix .
self assert: (a=b).
self assert: (b=a).
self assert: (a hash=b hash).
a:=DhbMatrix rows: #((1 2 3)(2 4 5)(3 5 6)).
self assert: (a~=b).
self assert: (b~=a).
self assert: (a hash~=b hash).
a:=a asSymmetricMatrix .
self assert: (a~=b).
a:=2 .
self assert: (b~=a).
a:='s' .
self assert: (b~=a).



