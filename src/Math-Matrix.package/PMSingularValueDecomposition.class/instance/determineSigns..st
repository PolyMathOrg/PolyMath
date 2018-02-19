private
determineSigns: aMatrix
	"comment stating purpose of message"
	
	signU := (1 to: m) collect: [ :i |
		| ui |
		ui := u columnAt: i.
		
		(1 to: n) inject: 0 into: [ :sum :j |
			| aj prod |
			aj := aMatrix columnAt: j.
			prod := ui * aj.
			sum + ((prod sign) * (prod ** 2)) ] ].
	
	signV := (1 to: n) collect: [ :i |
		| vi |
		vi := v columnAt: i.
		
		(1 to: m) inject: 0 into: [ :sum :j |
			| aj prod |
			aj := aMatrix rowAt: j.
			prod := vi * aj.
			sum + ((prod sign) * (prod ** 2)) ] ].
	
	1 to: (m min: n) do: [ :i |
		| signUi signVi |
		signUi := signU at: i.
		signVi := signV at: i.
		
		((signUi * signVi) < 0) ifTrue: [ 
			(signUi < signVi)
				ifTrue: [ signU at: i put: (-1 * signUi) ]
				ifFalse: [ signV at: i put: (-1 * signVi) ]]].
		
	signU := signU asPMVector.
	signV := signV asPMVector.