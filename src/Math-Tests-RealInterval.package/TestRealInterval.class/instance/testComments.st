tests - accessing
testComments
b comments: 'AAA'.
self assert: b comments= (OrderedCollection  with: 'AAA') .
b:=z/z.
self assert: b comments= (OrderedCollection with: 'zeroDivide').
self assert: a comments= OrderedCollection new .
