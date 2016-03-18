running
setUp 
z:=RealInterval fromNumber: 0.
o:=RealInterval fromNumber: 1.
a:=RealInterval inf: 0 sup: Float infinity .
b:=RealInterval entire .
c:=RealInterval inf: 1 sup: 7 .
d:=RealInterval inf: -1 sup: 8 .
e:=RealInterval inf: (-5/4) sup: (-3/4) .
g:=RealInterval inf: 2 sup: Float infinity .
h:=RealInterval inf: Float infinity negated sup: 2 .
empty:=RealInterval new .
i:=IntervalUnion new.
x:=IntervalUnion with: g with: 0 with:e.