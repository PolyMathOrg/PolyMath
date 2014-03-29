running
setUp
r :=(rand next:2000) asOrderedCollection 
		collect:   [:n| collType with: n].
m :=(1 to: 2000) asOrderedCollection 
		collect:   [:n| collType newFrom: (rand next:4)].
aTree :=IndexedKDTree withAll: m.
bTree :=IndexedKDTree withAll: r.