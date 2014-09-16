creation
function: aBlock data: aCollectionOfPoints minimumValues: anArray maximumValues: anotherArray 
(aBlock isBlock and:[aBlock numArgs > 1]) ifFalse: 
	[^self error: 'aBlock must be a Block with one independent variable and at least one parameter' ].
^self new 
	function: aBlock; 
	data: (aCollectionOfPoints as: DataHolder); 
	minValues: anArray maxValues: anotherArray;
	yourself  