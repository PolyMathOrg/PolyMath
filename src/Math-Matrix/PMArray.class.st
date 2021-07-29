Class {
	#name : #PMArray,
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
PMArray class >> fromNestedArray: anArray [

	^ self new array: anArray flattened withShape: (self shape:anArray)
]

{ #category : #'instance creation' }
PMArray class >> newWith: anInteger [

	^ self new array: {anInteger} withShape: #(  )
]

{ #category : #accessing }
PMArray class >> shape: anArray [

anArray isArray ifFalse:[^#()]
ifTrue:[
	^ {anArray size}, (self shape: anArray first)
	]

]

{ #category : #comparing }
PMArray >> = anArray [

	^ array = anArray array & (first = anArray first)
	  & (strides = anArray strides) & (shape = anArray shape)
]

{ #category : #accessing }
PMArray >> array [ 
^array
]

{ #category : #'as yet unclassified' }
PMArray >> array: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #accessing }
PMArray >> first [ 
^first
]

{ #category : #'primitives - file' }
PMArray >> flattenedIndexOf: coords [

	| position |
	position := 1.
	coords withIndexDo: [ :elt :i | 
		position := (elt - 1) * (strides at: i) + position ].
	^ position
]

{ #category : #'as yet unclassified' }
PMArray >> fromNestedArray: aFlatArray withShape: aShape [

	array := aFlatArray.
	shape := aShape copy.
	self updateFirst.
	shape ifNotEmpty: [ self updateStrides]
]

{ #category : #public }
PMArray >> get: coords [

	| position |
	position := self flattenedIndexOf: coords.
	^ array at: position
]

{ #category : #accessing }
PMArray >> rank [
	^ shape size
]

{ #category : #'as yet unclassified' }
PMArray >> reshape: aNewShape [

	^ self viewWithShape: aNewShape.

]

{ #category : #initialization }
PMArray >> set: coords value: aValue [

array at: (self flattenedIndexOf: coords) put: aValue
]

{ #category : #accessing }
PMArray >> shape [

	^ shape
]

{ #category : #accessing }
PMArray >> size [

^ shape inject: 1 into:  [  :each :product | each * product].
	
]

{ #category : #accessing }
PMArray >> strides [ 
^strides 
]

{ #category : #'as yet unclassified' }
PMArray >> updateFirst [

	first := Array new: shape size withAll: 1
]

{ #category : #'as yet unclassified' }
PMArray >> updateStrides [

	strides := Array new: shape size.
	strides at: shape size put: 1.
	((shape size -1) to: 1 by: -1) do: [ :i | 
		strides at: i put: ((strides at: i + 1) * (shape at: i+1))]
]

{ #category : #'as yet unclassified' }
PMArray >> view [

	"Share only the array"

	^ self viewWithShape: shape
]

{ #category : #'as yet unclassified' }
PMArray >> viewWithShape: aNewShape [

	^ PMArray new array: self array withShape: aNewShape

]
