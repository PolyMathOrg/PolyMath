mathematical functions
raisedTo: anInt 
|i u l s|
self isEmpty ifTrue: [ ^RealInterval new ].
anInt isIntervalUnion ifTrue:[^anInt adaptToNumber: self andSend: #raisedTo:].
((sup<0)and: [anInt isInteger not and: [anInt isAnInteger not]]) ifTrue: [ ^RealInterval new ].
s:=RealInterval inf: (inf max:0) sup: sup.
anInt isNumber 
	ifFalse: [ 
		anInt isEmpty ifTrue: [ ^RealInterval new ].
		i:=anInt splitAtZero.
		^(s privateRaisedTo: i first negated)reciprocal union: (s privateRaisedTo: i second)  ]
	ifTrue:[
		i:=anInt asNumber .
		(i isInfinite not and: [i \\ 1= 0]) ifTrue:[i:=i asInteger].
		i isInteger 
			ifTrue: [ ^self raisedToInteger: i ] 
			ifFalse:[
				l:=((s inf =0)ifTrue: [ Float infinity ] ifFalse: [s inf raisedTo: i]).
				u:=((s sup =0) 
					ifTrue: [(s inf =0) 
						ifTrue: [^RealInterval inf: 0 sup: 0  ]  
						ifFalse: [Float infinity  negated] ]  
					ifFalse: [s sup raisedTo: i]).
				l>u ifTrue: [i:=l.l:=u.u:=i ].
				((s includes: 1)and:[1<l]) ifTrue:[l:=1].
				^RealInterval inf: l sup: u ]  ].
