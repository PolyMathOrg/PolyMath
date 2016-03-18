tests - converting
testEnlargeToWidth
self assert:(empty copy enlargeToWidth: Float infinity) = empty.
self assert:(empty copy enlargeToWidth: 1) = empty.
self assert:(o copy enlargeToWidth: Float infinity)=b.
self assert:(z copy enlargeToWidth: 0.5) = (RealInterval inf: -0.25 sup: 0.25) .
self assert:(a copy enlargeToWidth: 0.5) = a.
self assert:(b copy enlargeToWidth: 0.5) = b.
self assert:(c copy enlargeToWidth: 1) = c.
e enlargeToWidth: 2.
self assert: e =(RealInterval inf: -2 sup: 0).
self assert:(c-4 enlargeToWidth: 8) =(RealInterval inf: -4 sup: 4).
