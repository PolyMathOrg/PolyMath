tests
testPrintOn2
|aStream s|
aStream :=ReadWriteStream with:''.
(IndexedKDTree withAll: #(#(1)))printOn: aStream.
s :=aStream contents .
self assert: ((s findString: 'an IndexedKDTree')=1).
self assert: ((s allRangesOfSubString: '1')size=2).