tests
testIndexedKDTreeExtremeCase
	| bResult |
	tree := PMIndexedKDTree withAll: #(#(1)).	"extreme case"
	bResult := tree nnSearch: #(-1) i: 3.
	self assert: bResult size equals: 1.
	self assert: bResult first equals: #(1 4)	"index 1, squared distance 4"