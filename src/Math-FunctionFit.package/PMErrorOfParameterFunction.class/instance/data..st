accessing
data: aCollectionOfPoints 
"a collection of points x@f(x)"
(aCollectionOfPoints isCollection and: [aCollectionOfPoints allSatisfy: [:aPoint| aPoint isPoint]]) ifFalse: 
	[self error: 'data must be a Collection of Points'].
aCollectionOfPoints ifEmpty: [CollectionIsEmpty signalWith: aCollectionOfPoints].
data := aCollectionOfPoints .
quartile ifNotNil:[ self quartile: quartile] .
^data