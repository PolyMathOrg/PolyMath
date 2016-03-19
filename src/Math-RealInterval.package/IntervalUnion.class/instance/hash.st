comparing
hash
	| hash |
	self size=1 ifTrue:[^self first hash].
	self isEmpty ifTrue: [ ^RealInterval new hash ].
	hash := self species hash.
	self do: [:i | hash := (hash + i hash) hashMultiply].
	^hash