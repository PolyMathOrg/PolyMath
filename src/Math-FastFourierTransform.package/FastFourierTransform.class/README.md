A FastFourierTransform can be initialized with: 
FastFourierTransform data: anArrayOfNumbersOrComplex
you can look at the data with #data, #realData and #imaginaryData.
#transform calculates the Fourier transform (in place, iow you get the transform again with #data etc) and #inverseTransform does the inverse. 