tests
testPrintOn
|m stream|
stream := String new writeStream.
m:=DhbMatrix new.
"this raised an error:"
m printOn: stream .