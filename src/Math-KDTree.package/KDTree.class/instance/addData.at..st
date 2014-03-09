initialize
addData: aSequenceableCollection at: dimension
|sorted cut nextDimension|
dim :=dimension . 
aSequenceableCollection size =1 ifTrue: [value :=aSequenceableCollection first . self adjustValue . ^self ].
sorted :=self sort: aSequenceableCollection .
cut :=sorted size + 1// 2.
value :=sorted at: cut .
self adjustValue .
nextDimension :=dimension  \\(value size) +1.
cut >1 ifTrue: [left :=self class new addData: (sorted copyFrom: 1 to: cut -1 )  at: nextDimension].
right :=self class new addData: (sorted copyFrom: cut +1 to: sorted size)  at: nextDimension.