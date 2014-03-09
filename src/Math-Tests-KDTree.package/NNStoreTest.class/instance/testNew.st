tests
testNew
|n|
n:=NNStore new:1.
self assert: n isEmpty .
self assert: (n data =#()).
self assert: (n completeData  =#()).
n add: #(1 2).
n add: #(3 1). "will not be added"
self assert: (n data =#(2)).
