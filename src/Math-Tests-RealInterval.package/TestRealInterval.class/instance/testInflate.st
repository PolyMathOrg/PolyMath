tests - converting
testInflate
|x|
self assert: empty inflate =empty .
self assert: b inflate =b .
x:=a inflate .
self assert:x sup =Float infinity .
self assert: ((x inf closeTo: 0)and:[x inf<0]).
x:=d inflate .
self assert: ((x width closeTo: d width)and:[x width>d width]).
self assert: (x includes: d)
