tests-converting
testAsSimpleBoxes
|y|
self assert: x asSimpleBoxes =(OrderedCollection with: x).
x at:3 put: (IntervalUnion from: -1 to:1).

y:=x copy.
y at:3 put: (IntervalUnion from: -1 to:1).
self assert: y asSimpleBoxes =(OrderedCollection with: (x copy at:3 put: -1;yourself)with: (x copy at:3 put: 0;yourself)with: (x copy at:3 put: 1;yourself)).
y at:1 put: (IntervalUnion from: 0 to:1).
self assert: y asSimpleBoxes =(OrderedCollection with: (x copy at:1 put: 0;at:3 put: -1;yourself)with: (x copy at:1 put: 0;at:3 put: 0;yourself)with: (x copy at:1 put: 0;at:3 put: 1;yourself)with: (x copy at:1 put: 1;at:3 put: -1;yourself)with: (x copy at:1 put: 1;at:3 put: 0;yourself)with: (x copy at:1 put: 1;at:3 put: 1;yourself)).
x:=IntervalBox new.
self assert: x asSimpleBoxes =(OrderedCollection with: x).