accessing
nextFloatExcludeUpper
  " Answer a random float number in the interval [ 0 , 1 ) "

  ^ self nextInteger * ( 1.0 / (4294967296.0 * 2) )