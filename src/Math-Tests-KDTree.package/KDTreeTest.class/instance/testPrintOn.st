tests
testPrintOn
|aStream s|
aStream :=ReadWriteStream with:''.
(KDTree withAll: #(#(1)  #(4)))printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'a KDTree')=1).
self assert: ((s allRangesOfSubstring: 'nil')size=3). "3 empty leafs should be printed"
self assert: ((s allRangesOfSubstring: '1')size=3). "twice dimension 1, once value 1"
self assert: ((s allRangesOfSubstring: '4')size=1).