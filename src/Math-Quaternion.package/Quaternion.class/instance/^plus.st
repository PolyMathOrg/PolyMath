arithmetic
+ aQuaternion 
	^ aQuaternion isQuaternion
		ifTrue: [self species
				qr: qr + aQuaternion qr
				qi: qi + aQuaternion qi
				qj: qj + aQuaternion qj
				qk: qk + aQuaternion qk]
		ifFalse: [aQuaternion adaptToQuaternion: self andSend: #+]