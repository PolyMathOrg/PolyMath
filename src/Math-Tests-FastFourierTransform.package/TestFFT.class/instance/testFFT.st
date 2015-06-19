tests
testFFT
|data data1 f s|
data:=(1 to: 256) collect: [:i | (Float pi * (i-1) / (256/8)) cos].
f:=FastFourierTransform data: data.
f transform.
f inverseTransform .
s:=(f imaginaryData select:[:i| i equalsTo: 0])size.
self assert: s=256.
s:=(f realData - data select:[:i|i equalsTo: 0])size.
self assert: s=256.
DhbMitchellMooreGenerator reset:1.
data1:=data collect:[:i|i+0.001 random -0.0005].
f:=FastFourierTransform data: data1.
f transform.
f chop:0.01.
f inverseTransform.
self assert:(f realData - data)abs max<4e-5.
data:=#(-2 -2 -2 3 3 3 1 -2).
f:=FastFourierTransform data: data.
f chop:1.01.
self assert: f realData =#(-2 -2 -2 3 3 3 0 -2).
f chop:2.01.
self assert: f realData =#(0 0 0 3 3 3 0 0).
f data: data.
f transform.
f inverseTransform .
s:=(f imaginaryData select:[:i| i equalsTo: 0])size.
self assert: s=8.
s:=(f realData - data select:[:i|i equalsTo: 0])size.
self assert: s=8.