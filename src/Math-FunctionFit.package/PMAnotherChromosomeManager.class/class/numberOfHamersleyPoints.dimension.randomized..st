utils
numberOfHamersleyPoints: n dimension: d randomized: aBoolean
"a bit randomized "
|dist|
dist :=1.0 / n.
^(1 to:  n) collect: [:number| (1 to: d)collect: [:dim|
		( dim=1)
		ifTrue:[aBoolean ifTrue: [(number/n)- dist random] ifFalse: [(number/n)]]
		ifFalse: [|sum prime| 
			sum :=0.
			prime :=Primes at: dim-1.
			(self integerDigitsFor: number base: prime)
				reverse withIndexDo: [:i :index|sum:= i/(prime raisedToInteger: index)+sum.].
			aBoolean ifTrue: [sum + dist random] ifFalse: [sum] ] ]]. 