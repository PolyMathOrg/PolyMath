initializing
initPermTable
	| r |
	permTable := OrderedCollection new: n // 2.
	2 to: n - 1 do: [ :i | 
		r := (i - 1 bitReverse: nu) + 1.
		r > i
			ifTrue: [ permTable
					add:
						{i.
						r} ] ]