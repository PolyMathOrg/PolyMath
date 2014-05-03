*Math-DHB-wk
swapColumn: anIndex withColumn:   a2Index
|aColumn |
aColumn :=self  columnAt: a2Index   .
self  atColumn: a2Index  put:  (self  columnAt: anIndex ) . 
self  atColumn: anIndex put: aColumn .