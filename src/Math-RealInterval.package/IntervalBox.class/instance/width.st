accessing
width
|max m|
max:=0.
self do: [:i|(m:= i width)isNaN ifTrue: [^m]. max :=max max: m].
^max