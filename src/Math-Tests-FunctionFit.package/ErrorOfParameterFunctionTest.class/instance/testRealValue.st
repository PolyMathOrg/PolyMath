tests
testRealValue
f:=ErrorOfParameterFunction function: [ :i :a|i+a ] data: { 1@1. 2@2 }.
f errorType: #squared.
self assert:((f realValue:#(-2))=2 ). 
f errorType: #abs.
self assert:((f realValue:#(-2))=2). 
f errorType: #median.
self assert:((f realValue:#(-2))=2). 
f relativeError: true.
f errorType: #squared.
self assert:((f realValue:#(-2))=(5/2)sqrt ). 
f errorType: #abs.
self assert:((f realValue:#(-2))= (3/2)). 
f errorType: #median.
self assert:((f realValue:#(-2))=1 ).
