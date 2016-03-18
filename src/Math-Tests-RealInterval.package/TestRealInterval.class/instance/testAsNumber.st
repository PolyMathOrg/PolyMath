tests - converting
testAsNumber
|n x|
x:= z asNumber.
self assert: x ==0.
n:=-23.987.
x:=RealInterval fromNumber: n.
x:= x asNumber.
self assert: x =n.
self assert: x isFloat.
"asNumber does the converting only if possible:"
self assert:  b asNumber =b. 
self assert:  e asNumber =e. 
