Extension { #name : #Collection }

{ #category : #'*Math-Statistics' }
Collection >> geometricMean [
	"Answer with the geometric mean of the collection"
	"#(1 1 2 3 4 5 5 6 6 7 8 9) geometricMean  >>> 3.8583980015011217"
	"{ 4. 1.  1 / 32} geometricMean >>> 0.49999999999999994"
	"#(3.14 1 4.56 0.333) geometricMean >>> 1.4776945822943937"
	"{1/3. 2/3. 8/3. 16/3} geometricMean >>> 1.3333333333333335"

	self detect: [ :i | i < 0 ] ifFound: [ Error new signal: 'The geometric mean should not be calculated on negative numbers' ] .
	
	"For large collections there is a chance of Float overflow/underflow when raising to a fraction. 
	 Instead sum the logarithms with the side effect that the returned value will be a Float and subject 
	 to floating point arethmetic imprecision"
	"^(self reduce: [ :a :b | a * b ] ) raisedToFraction:  1 / self size."
	^((self collect: #ln) sum / self size) exp
]

{ #category : #'*Math-Statistics' }
Collection >> harmonicMean [
	"Answer with the harmonic mean of the data."
	"#(2.5, 3, 10) harmonicMean >>> 3.6"
	| sum |
	
	self detect: [ :i | i < 0 ] ifFound: [ Error new signal: 'The harmonic mean cannot be calculated on negative numbers' ] .
	
	sum := 0.
	self do: [ :i |  sum := (sum + (1 / i))].
	^self size / sum.
	
]

{ #category : #'*Math-Statistics' }
Collection >> mode [
	"answers with the most common value in a collection.
	
	If there are values that are equally common then the one that is 
	smallest is returned."
	"#(1 2 2 2 3 4 5) mode  >>> 2"
	"#(5 5 1 1 2 3 4) mode  >>> 1"
	
	^(self asBag sortedCounts at: 1) value.
]
