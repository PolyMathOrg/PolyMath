Class {
	#name : #PMNDArray,
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
PMNDArray class >> fromNestedArray: anArray [

	^ self new array: anArray flattened withShape: (self shape:anArray)
]

{ #category : #'instance creation' }
PMNDArray class >> fromScalar: anInteger [

	^ self new array: {anInteger} withShape: #(  )
]

{ #category : #'instance creation' }
PMNDArray class >> newWith: anInteger [

	^ self new array: {anInteger} withShape: #(  )
]

{ #category : #accessing }
PMNDArray class >> shape: anArray [

anArray isArray ifFalse:[^#()]
ifTrue:[
	^ {anArray size}, (self shape: anArray first)
	]

]

{ #category : #comparing }
PMNDArray >> = aPMNDArray [

	^ array = aPMNDArray asArray & (first = aPMNDArray first)
	  & (strides = aPMNDArray strides) & (shape = aPMNDArray shape)
]

{ #category : #'as yet unclassified' }
PMNDArray >> array: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #private }
PMNDArray >> asArray [ 
	^array 
]

{ #category : #public }
PMNDArray >> at: coords [

	| position |
	position := self flattenedIndexOf: coords.
	^ array at: position
]

{ #category : #initialization }
PMNDArray >> at: coords put: aValue [

array at: (self flattenedIndexOf: coords) put: aValue
]

{ #category : #accessing }
PMNDArray >> first [ 
^first
]

{ #category : #'primitives - file' }
PMNDArray >> flattenedIndexOf: coords [

	| position |
	position := 1.
	coords withIndexDo: [ :elt :i | 
		position := (elt - 1) * (strides at: i) + position ].
	^ position
]

{ #category : #'as yet unclassified' }
PMNDArray >> fromNestedArray: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #operation }
PMNDArray >> hadamardProduct: aPMNDArray [
	^ self with: aPMNDArray collect: [:a :b| a*b]
	
	
]

{ #category : #testing }
PMNDArray >> hasSameShapeAs: aPMNDArray [
	^ self shape = aPMNDArray shape
]

{ #category : #accessing }
PMNDArray >> rank [
	^ shape size
]

{ #category : #'as yet unclassified' }
PMNDArray >> reshape: aNewShape [

	^ self viewWithShape: aNewShape.

]

{ #category : #accessing }
PMNDArray >> shape [

	^ shape
]

{ #category : #accessing }
PMNDArray >> size [

^ shape inject: 1 into:  [  :each :product | each * product].
	
]

{ #category : #accessing }
PMNDArray >> strides [ 
^strides 
]

{ #category : #'as yet unclassified' }
PMNDArray >> updateFirst [

	first := Array new: shape size withAll: 1
]

{ #category : #'as yet unclassified' }
PMNDArray >> updateStrides [

	strides := Array new: shape size.
	strides at: shape size put: 1.
	((shape size -1) to: 1 by: -1) do: [ :i | 
		strides at: i put: ((strides at: i + 1) * (shape at: i+1))]
]

{ #category : #'as yet unclassified' }
PMNDArray >> view [

	"Share only the array"

	^ self viewWithShape: shape
]

{ #category : #'as yet unclassified' }
PMNDArray >> viewWithShape: aNewShape [

	^ PMNDArray new array: self asArray withShape: aNewShape

]

{ #category : #operation }
PMNDArray >> with: aPMNDArray collect: aBlock [
	(self hasSameShapeAs: aPMNDArray)
		ifFalse:[ShapeMismatch signal ].
	^ self class new array: ((self asArray) with: (aPMNDArray asArray) collect: aBlock)
		withShape: self shape.
	
	
]
