private
transformForward: forward
	| lev lev1 ip  temp temp2 i |
	permTable do: [ :j | data swap: j first with: j second ].
	1 to: nu do: [ :level | 
		lev := 1 bitShift: level.
		lev1 := lev // 2.
		1 to: lev1 do: [ :j | 
			temp := self multiplier: (j - 1) * (n // lev).
			forward ifFalse: [ temp := temp conjugated ].
			i := j.
			[ i <= n ]
				whileTrue: [ 
					ip := i + lev1.
					temp2 := (data at: ip) * temp.
					data at: ip put: (data at: i) - temp2.
					data at: i put: (data at: i) + temp2.
					i := i + lev ] ] ].
self scaleData .