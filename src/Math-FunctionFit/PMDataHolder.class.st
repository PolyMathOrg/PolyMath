"
DataHolder is an Array of Points and is used only internally by FunctionFit.
"
Class {
	#name : #PMDataHolder,
	#superclass : #Array,
	#type : #variable,
	#category : #'Math-FunctionFit'
}

{ #category : #iterators }
PMDataHolder >> pointsAndErrorsDo: aBlock [
"uses an unweighted approach; the weighted one does not make sense here and is dangerous, if done too naively, eg because of negative or infinite weights"
	self do:
		[ :each | aBlock value: (PMWeightedPoint point: each)]
]
