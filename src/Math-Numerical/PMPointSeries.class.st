Class {
	#name : #PMPointSeries,
	#superclass : #Object,
	#instVars : [
		'points'
	],
	#category : #'Math-Numerical'
}

{ #category : #creation }
PMPointSeries class >> new [
	"Create a new instance and initialize it"
	^super new initialize
]

{ #category : #'public methods' }
PMPointSeries >> add: anObject [
	"Add a point to the receiver"
	self primitiveAdd: anObject.
	self changed: self changedSymbol.
	^anObject
]

{ #category : #'public methods' }
PMPointSeries >> at: anInteger [
	^points at: anInteger
]

{ #category : #'public methods' }
PMPointSeries >> changedSymbol [
	"Answers the symbol of the event sent when the points of the receiver change"
	^#pointsChanged
]

{ #category : #'public methods' }
PMPointSeries >> collectPoints: aBlock [
	^points collect: aBlock
]

{ #category : #'public methods' }
PMPointSeries >> do: aBlock [
	self pointsDo: aBlock
]

{ #category : #'public methods' }
PMPointSeries >> firstPoint [
	"Answers the first point stored in the receiver"
	^self at: 1
]

{ #category : #'public methods' }
PMPointSeries >> initialize [
	"Create the point collection"
	points := SortedCollection sortBlock: self sortBlock.
	^self
]

{ #category : #'public methods' }
PMPointSeries >> isEmpty [
	^points isEmpty
]

{ #category : #'public methods' }
PMPointSeries >> notEmpty [

	^ points isNotEmpty
]

{ #category : #'public methods' }
PMPointSeries >> pointCollection [
		" Answer the collection of points."
	^self collectPoints: [ :each | each]
]

{ #category : #'public methods' }
PMPointSeries >> pointsDo: aBlock [
	points do: aBlock.
]

{ #category : #privateMethods }
PMPointSeries >> primitiveAdd: aPoint [
	"Private - Add a point to the receiver"
	points add: aPoint.
]

{ #category : #privateMethods }
PMPointSeries >> primitiveRemove: aPoint [
	"Private - Removes a point from the receiver"
	points remove: aPoint.
]

{ #category : #'public methods' }
PMPointSeries >> remove: anObject [
	"Add a point to the receiver"
	self primitiveRemove: anObject.
	self changed: self changedSymbol.
	^anObject
]

{ #category : #'public methods' }
PMPointSeries >> size [
	^points size
]

{ #category : #'public methods' }
PMPointSeries >> sort [
	points := ( points asSortedCollection: self sortBlock) asOrderedCollection
]

{ #category : #privateMethods }
PMPointSeries >> sortBlock [
		"Private"
	^[ :a :b | a x < b x]
]
