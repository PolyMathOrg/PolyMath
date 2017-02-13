accessing
quartile: aFloat
"quartile: is used by errortypes #quartile and #insensitive."
aFloat >1 | (aFloat <0) ifTrue:[^DomainError signal:'quartile must be between 0 and 1'].
data ifNotNil: [qPosition :=(data size -1.00001 * aFloat )rounded+1]. "-1.00001 because x.5 is rounded up to x+1 and pharos median rounds the position down"
^quartile := aFloat .