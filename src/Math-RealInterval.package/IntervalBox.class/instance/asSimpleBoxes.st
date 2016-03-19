converting
asSimpleBoxes
"returns an OrderedCollection of Boxes that consist only of RealIntervals"
|oc|
oc :=OrderedCollection with: self.
1 to: self size do:[:index|
oc:=oc flatCollect: [ :ibox|
(ibox at: index) isIntervalUnion 
	ifTrue: [(ibox at:index)collect:[:j| |x|
		x:=ibox copy.
		x at:index put:j. x]]
	ifFalse:[{ibox}]]].
^oc