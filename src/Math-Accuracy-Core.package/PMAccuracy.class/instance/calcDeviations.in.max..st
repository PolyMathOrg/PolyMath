private
calcDeviations: aValue in: aCol max: aBoolean
	| c |
	c := self extremeCollection: aCol max:aBoolean .
 	c := aCol inject: c into: [:a :b| a with: b collect: [:a1 :b1| 
		aBoolean 
			ifTrue: [ a1 max: b1 ] 
			ifFalse: [a1 min: b1]]].
	^ c with: aValue collect: [:rr :r| self calcErrorOf: r realResult: rr ]