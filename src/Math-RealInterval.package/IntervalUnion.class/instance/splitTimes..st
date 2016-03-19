converting
splitTimes: anInteger 
"in a way nonsense, but then who cares, its simple for a simple algo-example"
|c|
c:=OpenIntervalUnion newFrom: self.
^c intervalCollect: [ :i|i splitTimes: anInteger  ].