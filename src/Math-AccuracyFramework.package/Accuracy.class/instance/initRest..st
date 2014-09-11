initialize-release
initRest: aName 
|i|
i := ('initialize', aName) asSymbol.
(self respondsTo: i) ifTrue: [ self perform: i].