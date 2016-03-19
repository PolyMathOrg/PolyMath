converting
asNumber
^(self size=1) 
	ifTrue: [ self first asNumber ] 
	ifFalse:[ self] 