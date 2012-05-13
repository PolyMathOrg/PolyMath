instance creation
withAll: aCollection
"this is the peferable form of instance creation for subclasses since freeIndex is correctly initialized this way. then 'sortFor:' must be overwritten and called at least once (an example is StupidNN). the other possibility is to use 'new:' and to fill NNStore subclass with 'add:' . the advantage is, that NNStore has not to be filled completely this way and the sorting logic can be applied outside of the subclass.
you cant enter the sorting index with this method. if you want to do that, use 'newFrom:' instead"
^(super withAll: (aCollection collect: [:coll| {nil. coll}]))freeIndex: aCollection size +1  