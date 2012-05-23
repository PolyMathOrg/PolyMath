stepping
doStep: aState time: t stepSize: dt
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Euler Method. Subclasses should override"
	| dxdt |
	dxdt := system x: aState t: t.
	aState isNumber 
		ifTrue: [^ (dt * dxdt + aState)]
		ifFalse:
			[(1 to aState size) 
			do: [:i | | xi | 
					xi := aState at: i.
					aState at: i put: (dxdt at: i) * dt + xi].
				^ aState.]