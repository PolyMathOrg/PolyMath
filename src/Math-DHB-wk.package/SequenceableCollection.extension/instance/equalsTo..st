*Math-DHB-wk
equalsTo: aSequenceableCollection
self with: aSequenceableCollection do: [:a :b| (a equalsTo: b) ifFalse: [^false]   ].
^true