tests-rest
testCopy
|x|
x:=a copy.
self assert: x=a.
self deny: x==a.
x inf:Float infinity negated .
a inf:(7/5).
x sup:4.6.
x comments: 'azer'.
self assert: x~=a.
self assert: a=(RealInterval inf: (7/5) sup: Float infinity).
self assert: x=(RealInterval inf: Float infinity negated sup: 4.6).
self assert: a comments =OrderedCollection new.
self assert: x comments =(OrderedCollection with: 'azer').

