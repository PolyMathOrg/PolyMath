information
distributionValue: aNumber
^(data collect:[:x|
			ikernel value: (aNumber - x / bandwidth) ])sum / data size 