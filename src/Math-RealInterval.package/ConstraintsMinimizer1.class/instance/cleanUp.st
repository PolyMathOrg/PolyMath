operation
cleanUp
|r|
result ifEmpty: [ r:= RealInterval new.result:={Array with: r with: r} ].
^super cleanUp .