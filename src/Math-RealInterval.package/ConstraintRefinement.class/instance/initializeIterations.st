operation
initializeIterations
|aBox|
result := OrderedCollection new.
initialQueue := "LinkedList new"OrderedCollection new:50. "LinkedList seems to be a bit slower"
(aBox :=(BoxSplicing constraints: constraints  box: box )doFastSplicing)isEmpty 
	ifTrue:[^result add:aBox] .
initialQueue add: aBox.
