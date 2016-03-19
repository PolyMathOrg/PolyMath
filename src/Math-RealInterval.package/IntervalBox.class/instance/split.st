converting
split
|d i cp|
d:= self maxWidthDimension .
i:=self at: d.
(i:= i split: i cutPoint) ifNil: [ ^nil ].
cp:= Array with: self copy with: self copy.
(cp at:1)at:d put: (i at:1).
(cp at:2)at:d put: (i at:2).
^cp
