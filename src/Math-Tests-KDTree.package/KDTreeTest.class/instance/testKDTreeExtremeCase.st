tests
testKDTreeExtremeCase
|bResult|

tree :=KDTree  withAll: #(#(1)).								
bResult :=tree nnSearch: #(2) i: 3.
self assert: (bResult size =1).
self assert: (bResult first = #(1) ).
self should: [ KDTree  withAll: #() ] raise: Exception.
self should: [ KDTree  withAll: #(2) ] raise: Exception.
self should: [ KDTree  withAll: #(#(2) #('v')) ] raise: Exception.
self should: [ KDTree  withAll: #(#(2) #()) ] raise: Exception.
self should: [ KDTree  withAll: #(#()) ] raise: Exception.
