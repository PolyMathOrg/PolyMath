accessing
seed: aWordArray
	"Initialize with an Array of eight 32-bits Integer"
	kernelRand1 := MarsagliaKissRandomKernel seed: (aWordArray first: 4).
	kernelRand2 := MarsagliaKissRandomKernel seed: (aWordArray last: 4).