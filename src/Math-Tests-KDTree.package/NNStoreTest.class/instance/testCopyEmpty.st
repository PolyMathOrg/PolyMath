tests
testCopyEmpty
|n m|
n :=NNStore newFrom:#(#(1 $a) #(3 1.0) #(0 '2')).
n:=n copyEmpty .
self assert: n isEmpty .
n add: #(2 10); add: #(1 100).
self deny: n isEmpty .
self assert: (n maxDistance=Float infinity). 	"because it is not yet full"
self assert: (n data =#(100 10)).
m:=n copyEmpty.
self assert: (m size =2). "size is reduced now"
m add: #(2 10); add: #(1 100).
self deny:(m=n).
self assert:(m completeData =n completeData ).