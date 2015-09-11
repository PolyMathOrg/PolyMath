evaluating
value: aNumber
	"smoothed result"
^(data collect:[:x|
			kernel value: (aNumber - x / bandwidth)])sum / (data size * bandwidth) 
