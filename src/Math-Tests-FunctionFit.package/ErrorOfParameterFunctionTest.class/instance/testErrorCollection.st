tests
testErrorCollection
f data: col.
f errorType: #squared.
self assert: ((f errorCollection:#(0 1))= {(1/4). (4/9). (9/16)}).
f errorType: #abs.
self assert:((f errorCollection:#(0 1))={(1/2). (2/3). (3/4)}). 
f errorType: #median.
self assert:((f errorCollection:#(1 1))=#(0 0 0)). 
