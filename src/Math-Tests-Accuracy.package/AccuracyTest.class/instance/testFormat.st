tests
testFormat
self assert: ((a format: #(1 'rez' 1.8899))= #('1.0' 'rez' '1.89') ).
self assert: ((a format: #(10 100 0.18899 0.018899))= #('10.0' '1.0e2' '0.189' '1.89e-2') ).
self assert:((a format: Float infinity )=#('Infinity')).
self assert:((a format: (0 - Float infinity) )=#('-Infinity'))