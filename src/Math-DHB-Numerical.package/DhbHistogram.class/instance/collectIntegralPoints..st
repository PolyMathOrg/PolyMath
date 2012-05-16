information
collectIntegralPoints: aBlock
		"Collects the points needed to display the receiver as an integral.
		 Needed to use polymorphic behavior when plotting the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/4/99 "
	| answer bin lastContents integral norm x |
	self isCached
		ifTrue: [ self flushCache].
	answer := OrderedCollection new: ( contents size * 2 + 1).
	bin := self minimum.
	answer add: ( aBlock value: bin @ 0).
	integral := self underflow.
	norm := self totalCount.
	contents do:
		[ :each |
		  integral := integral + each.
		  x := integral / norm.
		  answer add: ( aBlock value: bin @ x).
		  bin := bin + binWidth.
		  answer add: ( aBlock value: bin @ x).
		].
	answer add: ( aBlock value: bin @ 0).
	^answer asArray