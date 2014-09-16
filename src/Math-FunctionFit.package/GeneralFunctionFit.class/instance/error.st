accessing
error
"returns the sqrt of the mean of the sum of squared errors, or the mean abs error, or the quartile error, or the insensitive error"
result ifNil: [^nil].
^self error: result
