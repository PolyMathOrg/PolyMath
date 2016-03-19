accessing
projectionFrom: aNumber
"returns the nearest number in the receiver of the same type as aNumber, or Float nan if such a
number does not exist"
| b x|
(aNumber isNaN or:[self isEmpty ]) ifTrue: [ ^Float nan].
(self includes: aNumber) ifTrue:[^aNumber].
b:=aNumber<inf.
aNumber isFloat ifTrue: [ ^ b ifTrue: [ inf asFloat] ifFalse: [ sup asFloat ] ].
aNumber isInteger ifTrue: [ b 
	ifTrue: [
		x:=inf asInteger.
		^(self includes: x)
			ifTrue: [ x ] 
			ifFalse:[ x:=x+1. (self includes: x) ifTrue: [x] ifFalse:[Float nan]] ]
	ifFalse: [ 
		x:=sup asInteger.
		^(self includes: x)
			ifTrue: [ x ] 
			ifFalse:[ x:=x-1. (self includes: x) ifTrue: [x] ifFalse:[Float nan]] ] ].
aNumber isFraction  ifTrue: [ b 
	ifTrue: [
		x:=inf asFraction .
		^(self includes: x)
			ifTrue: [ x ] 
			ifFalse:[ 
				x:=inf asFloat successor asFraction . 
				(self includes: x) ifTrue: [x] ifFalse:[Float nan]] ]
	ifFalse: [ 
		x:=sup asFraction.
		^(self includes: x)
			ifTrue: [ x ] 
			ifFalse:[ 
				x:=inf asFloat predecessor asFraction .  
				(self includes: x) ifTrue: [x] ifFalse:[Float nan]] ] ].
	self error:'bug in projectionFrom:'.