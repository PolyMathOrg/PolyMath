instance creation
newQueue
^self sortBlock: [ :a :b|
	(a at:2)inf <= (b at:2)inf]