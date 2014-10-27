comparing
= aNNStore
^(self == aNNStore) or: 
	[ (self species =aNNStore species ) and:
		[(maxDistance =aNNStore maxDistance)and:
			[(self size=aNNStore size) and: 
				[self completeData  =aNNStore completeData] ] ] ]
