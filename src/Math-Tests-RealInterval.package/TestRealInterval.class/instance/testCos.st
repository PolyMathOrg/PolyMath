tests - mathematical functions
testCos
|x xc y y2 zc|
self assert: empty cos =empty.
self assert: z cos=o.
x:=Float halfPi / 2 .
xc:=x cos.
z:=x+0.1 .
zc:=z cos.
y:=(RealInterval inf: -1 sup: 1).
y2:=(RealInterval inf: zc sup: xc ).
self assert: a cos=y.
self assert: b cos=y.
self assert: c cos =y.
self assert: d negated cos=y.
self assert: h cos=y.
self assert: (RealInterval inf: z sup: (2*Float pi +x) )cos=y ."quadrants 11"
self assert: (RealInterval inf: x sup: z )cos=y2 ."11"
self assert: (RealInterval inf: (z - Float halfPi)  sup: (2*Float pi +x - Float halfPi) )cos=y ."44"
self assert: ((RealInterval inf: x sup: z )negated cos equalsTo: y2) ."44"
self assert: (RealInterval inf: (z - Float pi)  sup: (Float pi +x ) )cos=y ."33"
self assert: ((RealInterval inf: (x+ Float pi)  sup: (Float pi +z ) )cos equalsTo: y2  negated)."33"
self assert: (RealInterval inf: (z + Float halfPi)  sup: (2*Float pi +x + Float halfPi) )cos=y ."22"
self assert: ((RealInterval inf: (Float pi-z) sup: (Float pi-x) )cos equalsTo: y2 negated) ."22"
self assert: ((RealInterval inf: x sup: Float pi -x  )cos equalsTo: (RealInterval inf: xc negated sup: xc)) ."12"
self assert: ((RealInterval inf: x sup: Float pi + z  )cos equalsTo: (RealInterval inf: -1 sup: xc)) ."13"
self assert: ((RealInterval inf: x - (2* Float pi) sup:  z negated )cos equalsTo: (RealInterval inf: -1 sup: xc)) ."14"
self assert: ((RealInterval inf: (Float pi -z)negated sup: x )cos equalsTo: (RealInterval inf: zc negated sup: 1)) ."21"
self assert: ((RealInterval inf: (Float pi -x) sup: (Float pi +z) )cos equalsTo: (RealInterval inf: -1 sup: zc negated)) ."23"
self assert: ((RealInterval inf: (2* Float pi + 3) sup: (4* Float pi - z) )cos equalsTo: (RealInterval inf: -1 sup: zc )) ."24"
self assert: ((RealInterval inf: (Float pi + x) sup: (2* Float pi + z) )cos equalsTo: (RealInterval inf: xc negated sup: 1 )) ."31"
self assert: ((RealInterval inf: (Float pi + z) sup: (3* Float pi - x) )cos equalsTo: (RealInterval inf: xc negated sup: 1 )) ."32"
self assert: ((RealInterval inf: (Float pi + z) sup: (2* Float pi - x) )cos equalsTo: (RealInterval inf: zc negated sup: xc )) ."34"
self assert: ((RealInterval inf: z negated sup: x )cos equalsTo: (RealInterval inf: zc  sup: 1 )) ."41"
self assert: ((RealInterval inf: z negated sup: ( Float pi - x) )cos equalsTo: (RealInterval inf: xc negated  sup: 1 )) ."42"
self assert: ((RealInterval inf: x negated sup: ( Float pi + x) )cos =y) ."43"

