tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
KernelSmoothedDensity new printOn: aStream .
self assert: ((aStream contents findString: 'nil')>1).
aStream reset.
density printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'normal')>0).
self assert: ((s findString: '6')>0).
self assert: ((s findString: '0.50589967')>0).
