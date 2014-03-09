tests
testNew3
|n|
n:=NNStore new:0.
self assert: n isEmpty .
self assert: n isFull .
self assert: (n =n copyEmpty)  .
self assert: (n data =#()).
self assert: (n completeData  =#()).
