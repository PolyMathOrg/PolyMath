*Math-QuaternionExtensions
adaptToQuaternion: aQuaternion andSend: aByteSymbol
	^ self collect: [ :ea | aQuaternion perform: aByteSymbol with: ea ]