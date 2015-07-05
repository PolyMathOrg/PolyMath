*Math-DHB-wk
householder
	"returns a collection of the skalar beta and the housholder vector"
	|s v b u x |
	s :=self allButFirst.
	s := s *s.
	v := self copy.
	v at: 1 put: 1.  
	s = 0 
		ifTrue: [ b :=0 ] 
		ifFalse: [
			u :=((x:=self at:1)squared + s)sqrt .
			v 
				at: 1 
				put: ((x <=0) ifTrue: [x -u] ifFalse:  [0 - s / (x + u)]).
			b :=(v at: 1) squared * 2 / (s + (v at: 1) squared).
			v := v / (v at: 1) ].
	^{b. v}