tests
testTreeTypeData
|aTree|
aTree := KeyedTree new.
self assert: (a tree: aTree type: 'aa' data:'bb') = aTree.
self assert: aTree = (KeyedTree new at:'data'put:'bb'; at: 'type'put:'aa'; yourself) .
