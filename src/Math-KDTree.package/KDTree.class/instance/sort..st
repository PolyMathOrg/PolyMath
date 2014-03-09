private
sort: aSequenceableCollection
^ aSequenceableCollection sort:  [:a :b| (a  at: dim) < (b at: dim)] 