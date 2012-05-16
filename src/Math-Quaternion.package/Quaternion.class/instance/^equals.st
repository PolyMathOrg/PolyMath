comparing
= aQuaternion 
	"Answer true if both quaternion are equals.
	A quaternion might also equal a Complex or a Number or other kind of numbers.
	Implementation note: only work if Complex Octonion or other kind answer true to isNumber."

	^ aQuaternion isQuaternion
		ifTrue: [qi = aQuaternion qi
				and: [qj = aQuaternion qj
						and: [qk = aQuaternion qk
								and: [qr = aQuaternion qr]]]]
		ifFalse: [aQuaternion isNumber
				and: [aQuaternion adaptToQuaternion: self andSend: #=]]