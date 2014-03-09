comparing
= aNNStore
self == aNNStore ifTrue: [^true].
((self species =aNNStore species ) and:[(maxDistance =aNNStore maxDistance)and:[self size=aNNStore size ] ])
		ifFalse: [^false].
^ self completeData  =aNNStore completeData 
