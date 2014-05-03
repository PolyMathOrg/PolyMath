*Math-DHB-wk
equalsTo: aDhbMatrix
self rows with: aDhbMatrix rows  do: [:a :b|(a equalsTo: b)ifFalse: [^false] ].
^true 