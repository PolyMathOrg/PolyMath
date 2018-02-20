as yet unclassified
gridDataGeneratorOf: size
	"Demos from https://github.com/distillpub/post--misread-tsne/blob/master/public/assets/demo-configs.js"
	"A square grid with equal spacing between points."
	"Returns a PMMatrix"
	
	| array i |
	array := Array new: size*size. 
	i := 1.
	1 to: size do: [ :x | 1 to: size do: [ :y | array at: i  put: {x. y.}.
														i:=i+1] ].
	^ PMMatrix rows: array