tests
testAdjustDimensionUpTo
|a|
a:= DhbHistogram new.
a setDesiredNumberOfBins:20.
#(1 2 3 1 2.3 2.4) do:[:x|a accumulate:x].
self assert: a count=6.			"this..."
self assert:(a countAt:3)=1.	" and this did not work correctly"