tests
testMutate
|a f s|
a:=(1 to: 100)collect:  [:i| cm mutate: #(-4 4)].
f:=a collect: [:i|i first].
s :=f select:[:i|i>(-4)].
self assert: (s size between: 15 and: 60).
s :=f select:[:i|i=(-4)].
self assert: (s size >20).
s :=f select:[:i|i>(-3.8)or:[i<(-4.2)]].
self assert: (s size between: 3 and: 20).
s :=f select:[:i|i>(-3.9)or:[i<(-4.1)]].
self assert: (s size between: 6 and: 50).

f:=a collect: [:i|i second ].
s :=f select:[:i|i>(4)].
self assert: (s size between: 15 and: 60).
s :=f select:[:i|i=(4)].
self assert: (s size >20).
s :=f select:[:i|i<(3.8)or:[i>(4.2)]].
self assert: (s size between: 3 and: 20).
