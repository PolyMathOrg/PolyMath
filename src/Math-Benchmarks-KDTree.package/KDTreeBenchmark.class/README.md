you can set the sequenceableCollection class of the vectors. default is FloatArray ( eg when using run: ), which is the fastest for nnSearches (because of its use of primitives), although the building of the tree is slower than with other collection types. 
example:
KDTreeBenchmark run:5 with: OrderedCollection . 	"Print it"
