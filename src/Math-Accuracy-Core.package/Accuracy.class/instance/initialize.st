initialize-release
initialize
	self initNames.
	parameters := Dictionary new.
	arguments := Dictionary new.
	results := Dictionary new.
	aStream := WriteStream with: ''.
	iterations := 1.
	dataTree := KeyedTree new .
	names do: [ :n | self initRest: n ]