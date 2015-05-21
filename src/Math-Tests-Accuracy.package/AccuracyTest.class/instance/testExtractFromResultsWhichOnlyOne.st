tests
testExtractFromResultsWhichOnlyOne
self assert: (a extractFromResults: #( 'bla' 'blah') which: 2 onlyOne: false)='blah'.
self assert: (a testGetterAaa second) = #(true).
self assert: (a extractFromResults: #( 'bla' 'blah') which: 1 onlyOne: true)=#('bla' 'blah').
self assert: (a testGetterAaa second) = #(#(false) #(true)).
