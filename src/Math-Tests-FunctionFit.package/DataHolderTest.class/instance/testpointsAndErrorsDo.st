tests
testpointsAndErrorsDo
|g|
g:=PMDataHolder new: 2 withAll: 2@3.
g pointsAndErrorsDo: [:i|( i xValue =2)ifFalse:[self error].( i yValue =3)ifFalse:[self error].( i weight=1)ifFalse:[self error]].