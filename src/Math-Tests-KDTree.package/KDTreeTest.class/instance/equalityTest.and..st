running
equalityTest: aResult and: bResult
"tests whether two collections of collections are equal"
self assert:  ( (aResult  with: bResult   collect: [:a :b|a hasEqualElements: b])  allSatisfy: [:e|e])