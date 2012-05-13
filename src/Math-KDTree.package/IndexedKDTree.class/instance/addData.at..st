initialize
addData: anOrderedCollection at: dimension
|sorted cut nextdim|
dim :=dimension . 
anOrderedCollection size =1 ifTrue: [value :=anOrderedCollection first . index :=value first. value :=value at: 2. ^self ].
sorted :=anOrderedCollection sort:[:a :b| ((a at: 2)  at: dimension) < ((b at: 2) at: dimension) ].
cut :=sorted size + 1// 2.
value :=sorted at: cut .
index :=value first. value :=value at: 2. 
nextdim :=dimension  \\(value size) +1.
cut >1 ifTrue: [left :=self class new addData: (sorted copyFrom: 1 to: cut -1 )  at: nextdim].
right :=self class new addData: (sorted copyFrom: cut +1 to: sorted size)  at: nextdim.