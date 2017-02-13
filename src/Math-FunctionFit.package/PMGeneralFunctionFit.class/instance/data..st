accessing
data: aCollectionOfPoints
"the data, a collection of x@f(x), used to estimate the parameters"
self resetResult .
data :=aCollectionOfPoints.
dataTruncated:=false.
^errorFunction data: aCollectionOfPoints .