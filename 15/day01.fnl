(local fp (io.open :input/01 :rb))
(var floor 0)
(var counter 0)
(var fst-neg nil)

(macro +=         [x n]       `(set ,x (+ ,x ,n)))
(macro when-not   [n ...]     `(when (not ,n) ,...))
(macro while-let  [n v ...]   `(while true (let [,n ,v] ,...)))
(macro until-nil  [n v ...]   `(while-let ,n ,v (when-not ,n (lua :break)) ,...))
(macro set-if     [cond n v]  `(if ,cond (set ,n ,v)))

(until-nil byte (fp:read 1)
  (set-if (and (not fst-neg) (> 0 floor)) fst-neg counter)
  (+= floor (if (= byte "(") 1 -1))
  (+= counter 1))


(print "Day 01 Part A Solution:" floor)
(print "Day 02 Part B Solution:" fst-neg)
