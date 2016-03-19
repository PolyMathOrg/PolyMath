testing
includes: aBox
self with: aBox do:  [ :int :int2|(int includes: int2)ifFalse:[^false]].
^true