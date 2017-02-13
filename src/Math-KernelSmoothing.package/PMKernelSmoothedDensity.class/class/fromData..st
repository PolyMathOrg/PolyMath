instance creation
fromData: aCollectionOfNumbers
|result|
result := self new.
result  data: aCollectionOfNumbers; normal; ruleOfThumbBandWidth.
^result  