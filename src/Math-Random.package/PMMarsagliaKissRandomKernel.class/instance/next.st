stream access
next
	"Anwser a 32 bits positive integer in [0,16rFFFFFFFF]."
	jcong := jcong * 69069 + 1327217885 bitAnd: 16rFFFFFFFF.
	jsr := (jsr bitAnd: 16r0007FFFF) << 13 bitXor: jsr.
	jsr := jsr >> 17 bitXor: jsr.
	jsr := (jsr bitAnd: 16r07FFFFFF) << 5 bitXor: jsr.
	w := (w bitAnd: 16rFFFF) * 18000 + (w >> 16).
	z := (z bitAnd: 16rFFFF) * 30903 + (z >> 16).
	^jcong + jsr + ((w bitAnd: 16rFFFF) << 16) + z bitAnd: 16rFFFFFFFF