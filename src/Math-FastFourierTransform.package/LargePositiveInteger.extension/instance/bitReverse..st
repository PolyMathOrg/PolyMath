*Math-FastFourierTransform
bitReverse: highBit 	"This implementation is faster than super.from Squeak"		
| digitSize reversed |	
highBit < self highBit ifTrue: [ self error: 'Not enough bits.' ].	
digitSize := highBit + 7 // 8.	
reversed := self class new: digitSize.	
1 to: self digitLength do: [:i |reversed digitAt: digitSize + 1 - i put: (self digitAt: i) byteReversed].	
^reversed bitShift: highBit - (digitSize * 8)