information
collectPoints: aBlock
	"Collects the points needed to display the receiver.
	Needed to use polymorphic behavior when plotting the receiver."

	| answer bin |
	self isCached
		ifTrue: [ self flushCache ].
	answer := OrderedCollection new: contents size * 2 + 1.
	bin := self minimum.
	answer add: (aBlock value: bin @ 0).
	contents
		do: [ :each | 
			answer add: (aBlock value: bin @ each).
			bin := bin + binWidth.
			answer add: (aBlock value: bin @ each) ].
	answer add: (aBlock value: bin @ 0).
	^ answer asArray