accessing
dimensions: anArrayOfDimension
"sets the 2 dimensions of the boxes that will be shown. by default the first 2 dimensions will be used"
self assert: anArrayOfDimension size=2.
dimensions := anArrayOfDimension.
result ifNotNil: [ self calcBuilder; updateWindow].
^dimensions 