arithmetic
* aQuaternion 
	"Answer the result of multiplying self with aQuaternion.
	Distribute the product (qr + qi i +qj j + qk k)*(tr+ti i + tj j + tk k)
	with rules i*i=j*j=k*k=-1 and i*j=-k, j*k=-i, k*i=-j"
	^ aQuaternion isQuaternion
		ifTrue: [| tr ti tj tk | 
			tr := aQuaternion qr.
			ti := aQuaternion qi.
			tj := aQuaternion qj.
			tk := aQuaternion qk.
			^ self species
				qr: qr * tr - (qi * ti) - (qj * tj) - (qk * tk)
				qi: qr * ti + (qi * tr) + (qj * tk) - (qk * tj)
				qj: qr * tj + (qj * tr) + (qk * ti) - (qi * tk)
				qk: qr * tk + (qk * tr) + (qi * tj) - (qj * ti)]
		ifFalse: [(aQuaternion isNumber and: [aQuaternion isComplex not])
				ifTrue: ["handle case much faster than adapt..."
					self species
						qr: qr * aQuaternion
						qi: qi * aQuaternion
						qj: qj * aQuaternion
						qk: qk * aQuaternion]
				ifFalse: [aQuaternion adaptToQuaternion: self andSend: #*]]