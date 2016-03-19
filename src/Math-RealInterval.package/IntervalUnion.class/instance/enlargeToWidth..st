converting
enlargeToWidth: aNumber
"enlarges each interval in the union"
self do:[:i | i enlargeToWidth: aNumber].
self reduce.