running
mpTestFunction:aMatrix
 |inv mult| 
		inv :=aMatrix mpInverse .
		mult :=inv *aMatrix.
		self assert: (aMatrix * mult equalsTo: aMatrix  ).
		self assert: (mult *inv equalsTo: inv ).
		self assert: (mult transpose equalsTo:  mult ) .
		mult :=aMatrix *inv.
		self assert: (mult transpose equalsTo: mult ) 