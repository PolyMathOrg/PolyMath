showing
print
|exp|
exp := (Smalltalk hasClassNamed: 'DCTRCanvasExporter') ifTrue: [ #DCTRCanvasExporter asClass] ifFalse: [ #RTCanvasExporter asClass ].
exp := exp canvas: aView canvas.
exp format: #png;
	fileName: ((UIManager default request: 'Please enter file name' initialAnswer: 'export.png') 
		ifNil: [ ^ nil ]).
exp export. 
