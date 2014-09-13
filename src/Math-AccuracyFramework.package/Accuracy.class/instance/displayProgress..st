running
displayProgress: anArrayOfNames
'Checking'	displayProgressFrom: 1 to: anArrayOfNames size during: [ :bar | anArrayOfNames do: [ :n | 
					bar label: 'Checking ' , n.
					bar increment.
					self streamTest: n ] ].
^self