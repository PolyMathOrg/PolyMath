mathematical functions
simpleSign
self size =1 ifTrue:[^self first simpleSign ].
^(self intervalCollect: [:a | a isZeroInterval ifTrue: [RealInterval new] ifFalse: [a simpleSign] ]) asNumber