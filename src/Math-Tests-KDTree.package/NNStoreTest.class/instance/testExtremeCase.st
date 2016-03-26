tests
testExtremeCase
	| n |
	n := NNStore new.
	n sortFor: nil.	"this should indeed always be possible and shouldnt raise an error!"
	self assert: n isFull.
	n add: #(1 1).	"adding should also always be possible, although it will not be added in this case"
	self deny: n maxDistance = 1.
	n
		add:
			{(0 - Float infinity).
			1}.	"and this extreme case too."
	self assert: n isEmpty.
	self assert: n data equals: #().
	self should: [ n add: {nil . 1} ] raise: Error	"but this should always raise an error (not only in NNStores with size 0), also in subclasses, otherwise one can have strange bugs"