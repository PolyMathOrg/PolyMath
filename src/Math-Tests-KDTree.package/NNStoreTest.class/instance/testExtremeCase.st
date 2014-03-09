tests
testExtremeCase
|n|
n:=NNStore new.
self shouldnt: [n sortFor: nil] raise: Error. 
self shouldnt: [n add: #(1 1)] raise: Error .	"this should indeed always be possible!"
self deny: (n maxDistance=1).
self shouldnt: [n add: {0-Float infinity.1}] raise: Error . "and this extreme case too."
self assert: n isEmpty .
self assert: (n data =#()).
self should: [n add: {nil .1}] raise: Error . "but this should always raise an error (not only in NNStores with size 0), also in subclasses, otherwise one can have strange bugs"


