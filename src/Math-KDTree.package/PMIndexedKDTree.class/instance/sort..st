private
sort: aSequenceableCollection
^ aSequenceableCollection sort:  [:a :b| ((a at: 2)  at: dim) < ((b at: 2) at: dim)] 