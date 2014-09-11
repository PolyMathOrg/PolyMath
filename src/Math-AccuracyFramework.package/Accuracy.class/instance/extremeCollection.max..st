private
extremeCollection:acol max:aBoolean 
|c|
c:=acol first.
c:=c isCollection ifTrue: [c size] ifFalse:[1]. 
^Array new: c withAll: (aBoolean ifTrue: [ Float infinity negated] ifFalse: [Float infinity])