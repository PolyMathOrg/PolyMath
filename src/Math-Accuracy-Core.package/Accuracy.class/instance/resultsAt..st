accessing
resultsAt: aName
	^ results at: aName ifAbsent: [ results at: 'AllTheRest' ifAbsent: [ nil ] ] 