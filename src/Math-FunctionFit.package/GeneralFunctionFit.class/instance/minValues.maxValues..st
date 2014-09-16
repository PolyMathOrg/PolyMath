accessing
minValues: anArray maxValues: anotherArray 
"instead of an array one can also use a number, an array will then be filled with this number. eg one can use 0 instead of the tiresome #(0 0 0 0). minValues and maxValues need not  be absolutely correct. also results outside of this range, but nearby, will often be found."
	|array1 array2 aSize|
aSize := errorFunction function numArgs-1.
array1 := self class range: anArray size: aSize type: 'minimum'. 
array2 :=self class range: anotherArray size: aSize type: 'maximum'. 
(array2 - array1 allSatisfy: [:each| each >0]) ifFalse: 
	[^DomainError signal: 'maximum values should be greater than minimum values'].
self resetResult.
manager origin: array1.
manager range: (array2 - array1).