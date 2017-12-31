*Math-Core
equalsTo: aSequenceableCollection

"^ self = aSequenceableCollection "
self with: aSequenceableCollection do: [:a :b| (a equalsTo: b) ifFalse: [^false]   ].
^true