accessing
angle
	"answer the rotation angle associated with the receiver"

	| sinThetaSur2 cosThetaSur2 |
	sinThetaSur2 := self unreal abs.
	cosThetaSur2 := qr.
	^(sinThetaSur2 arcTan: cosThetaSur2) * 2