accessing
seed: aWordArray
	"Initialize with an Array of eight 32-bits Integer"
	kernelRand1 := PMMarsagliaKissRandomKernel seed: (aWordArray first: 4).
	kernelRand2 := PMMarsagliaKissRandomKernel seed: (aWordArray last: 4)