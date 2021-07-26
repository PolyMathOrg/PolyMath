Class {
	#name : #PMTensor,
	#superclass : #Object,
	#instVars : [
		'array',
		'shape',
		'first',
		'strides'
	],
	#category : #'Math-Matrix'
}

{ #category : #'instance creation' }
PMTensor class >> fromNestedArray: anArray [

	^ self new array: anArray flattened withShape: (self shape:anArray)
]

{ #category : #'instance creation' }
PMTensor class >> newWith: anInteger [

	^ self new array: {anInteger} withShape: #(  )
]

{ #category : #accessing }
PMTensor class >> shape: anArray [

anArray isArray ifFalse:[^#()]
ifTrue:[
	^ {anArray size}, (self shape: anArray first)
	]

]

{ #category : #comparing }
PMTensor >> = aTensor [

	^ array = aTensor array & (first = aTensor first)
	  & (strides = aTensor strides) & (shape = aTensor shape)
]

{ #category : #accessing }
PMTensor >> array [ 
^array
]

{ #category : #'as yet unclassified' }
PMTensor >> array: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #accessing }
PMTensor >> first [ 
^first
]

{ #category : #'primitives - file' }
PMTensor >> flattenedIndexOf: coords [

	| position |
	position := 1.
	coords withIndexDo: [ :elt :i | 
		position := elt - 1 * (strides at: i) + position ].
	^ position
]

{ #category : #'as yet unclassified' }
PMTensor >> flattenedIndexOf: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #'as yet unclassified' }
PMTensor >> fromNestedArray: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #public }
PMTensor >> get: coords [

	| position |
	position := self flattenedIndexOf: coords.
	^ array at: position
]

{ #category : #accessing }
PMTensor >> rank [
	^ shape size
]

{ #category : #'as yet unclassified' }
PMTensor >> reshape: aNewShape [

	^ self viewWithShape: aNewShape.

]

{ #category : #initialization }
PMTensor >> set: coords value: aValue [

array at: (self flattenedIndexOf: coords) put: aValue
]

{ #category : #accessing }
PMTensor >> shape [

	^ shape
]

{ #category : #accessing }
PMTensor >> size [

^ shape inject: 1 into:  [  :each :product | each * product].
	
]

{ #category : #accessing }
PMTensor >> strides [ 
^strides 
]

{ #category : #'as yet unclassified' }
PMTensor >> updateFirst [

	first := Array new: shape size withAll: 1
]

{ #category : #'as yet unclassified' }
PMTensor >> updateStrides [

	strides := Array new: shape size.
	strides at: shape size put: 1.
	((shape size -1) to: 1 by: -1) do: [ :i | 
		strides at: i put: ((strides at: i + 1) * (shape at: i+1))]
]

{ #category : #'as yet unclassified' }
PMTensor >> view [

	"Share only the array"

	^ self viewWithShape: shape
]

{ #category : #'as yet unclassified' }
PMTensor >> viewWithShape: aNewShape [

	^ PMTensor new array: self array withShape: aNewShape

]
