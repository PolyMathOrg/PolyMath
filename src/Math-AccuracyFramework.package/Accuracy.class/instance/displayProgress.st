running
displayProgress
'Checking'	displayProgressFrom: 1 to: names size during: [ :bar | names do: [ :n | 
					bar label: 'Checking ' , n.
					bar increment.
					self streamTest: n ] ].
^self