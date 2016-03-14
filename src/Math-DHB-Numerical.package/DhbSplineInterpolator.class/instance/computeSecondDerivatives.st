transformation
computeSecondDerivatives
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 7/4/99 "

	| size u w s dx inv2dx |
	size := pointCollection size.
	coefficients := Array new: size.
	u := Array new: size - 1.
	startPointDerivative isNil 
		ifTrue: 
			[coefficients at: 1 put: 0.
			u at: 1 put: 0]
		ifFalse: 
			[coefficients at: 1 put: -1 / 2.
			s := 1 / (( self xPointAt: 2) x - ( self xPointAt: 1) x).
			u at: 1
				put: 3 * s 
						* (s * (( self yPointAt: size) - ( self yPointAt: size - 1)) 
								- startPointDerivative)].
	2 to: size - 1
		do: 
			[:n | 
			dx := (self xPointAt: n) - (self xPointAt: ( n - 1)).
			inv2dx := 1 / (( self xPointAt: n + 1) - (self xPointAt: n - 1)).
			s := dx * inv2dx.
			w := 1 / (s * (coefficients at: n - 1) + 2).
			coefficients at: n put: (s - 1) * w.
			u at: n
				put: (((( self yPointAt: n + 1) - ( self yPointAt: n)) 
						/ (( self xPointAt: n + 1) - ( self xPointAt: n)) 
							- ((( self yPointAt: n) - ( self yPointAt: n - 1)) / dx)) * 6 
						* inv2dx - ((u at: n - 1) * s)) 
						* w].
	endPointDerivative isNil 
		ifTrue: [coefficients at: size put: 0]
		ifFalse: 
			[w := 1 / 2.
			s := 1 / ((self xPointAt:  size) - (self xPointAt: ( size - 1))).
			u at: 1
				put: 3 * s * (endPointDerivative 
								- (s * (self yPointAt: size) - (self yPointAt: size - 1))).
			coefficients at: size
				put: s - (w * (u at: size - 1) / ((coefficients at: size - 1) * w + 1))].
	size - 1 to: 1
		by: -1
		do: 
			[:n | 
			coefficients at: n
				put: (coefficients at: n) * (coefficients at: n + 1) + (u at: n)]