accessing
errorType: aSymbol
"valid errorTypes are: #squared, #abs, #insensitive, #quartile, #median. Default is #squared"
(aSymbol isSymbol and:[#(#squared #abs #insensitive #quartile #median) includes: aSymbol]) ifFalse: 
	[^MessageNotUnderstood signal: 'errorType must be one of the following Symbols: #squared, #abs, #insensitive, #quartile, #median'].
(#(#quartile #insensitive) includes: aSymbol)ifFalse: [self quartile: 1/2].	"reset quartile to default, if it is not used" 
aSymbol =#median ifTrue: [^errorType :=#quartile] .
^errorType :=aSymbol