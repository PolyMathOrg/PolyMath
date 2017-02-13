sorting
sort
self ifEmpty: [^self].
self sort: [:a :b| a first < b first ] .
 maxDistance := self last first .