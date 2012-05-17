accessing
peekSeed
    "Private - Answer the next Integer seed calculated using Park and Miller's 'Minimum Standard'
    congruential generator. The seed is in the range 0..16r7FFFFFFF."

    ^ ( seed * ( 7 raisedToInteger: 5 ) ) rem: 16r7FFFFFFF
