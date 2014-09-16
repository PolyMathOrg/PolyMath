accessing
errorType: aSymbol
	"defines what kind of fitting should be used. valid errorTypes are: #squared, #abs, #insensitive, #quartile, #median. Default is #squared"
self resetResult.
^errorFunction errorType: aSymbol 