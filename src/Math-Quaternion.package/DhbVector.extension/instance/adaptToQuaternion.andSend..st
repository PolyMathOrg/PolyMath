*Math-Quaternion-Extensions
adaptToQuaternion: aQuaternion andSend: aByteSymbol 
	^ self collect: [:ea | aQuaternion perform: aByteSymbol  with: ea].