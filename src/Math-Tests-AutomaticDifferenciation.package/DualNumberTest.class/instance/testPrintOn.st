tests
testPrintOn
|stream|
stream := ReadWriteStream on: ''.
three printOn: stream.
self assert: (stream contents includesSubstring:' 3.0') .
self assert: (stream contents includesSubstring:' 1') .