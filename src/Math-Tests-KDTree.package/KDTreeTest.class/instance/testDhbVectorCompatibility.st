tests
testDhbVectorCompatibility
|aVector bVector r|
(Array lookupSelector: #asDhbVector) ifNil:[^self  skip: 'necessary dhb package not loaded'].
aVector :=#(0)asDhbVector.
bVector :=#(-2.0)asDhbVector.
r:={aVector. #(-5.0)asDhbVector. bVector} asDhbVector .
self initializeTreeWith: r as: true .	
self assert:((tree nnSearch: bVector  i:2) ={bVector.aVector}).
self assert:((stupid nnSearch: bVector  i:2) ={bVector.aVector}).
self initializeTreeWith: r as: false .	
r:=	tree nnSearch: bVector  i:2.
self assert:((r first) =#(3 0.0) ).
self assert:(r second first =1).
self assert:(r second second closeTo: 4.0 ).