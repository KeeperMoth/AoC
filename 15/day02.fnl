(local fp (io.open :input/02 :rb))
(var sqftPaper 0)
(var ftRibbon 0)


(macro +=         [x n]       `(set ,x (+ ,x ,n)))
(macro when-not   [n ...]     `(when (not ,n) ,...))
(macro while-let  [n v ...]   `(while true (let [,n ,v] ,...)))
(macro until-nil  [n v ...]   `(while-let ,n ,v (when-not ,n (lua :break)) ,...))


(fn min2          [arr]       (table.sort arr) [(. arr 1) (. arr 2)])
(fn surface-area  [l w h]     (+ (* 2 l w) (* 2 w h) (* 2 h l)))
(fn area          [l w]       (* l w))

(until-nil line (fp:read :*l) (local f (string.gmatch line "%d+"))
  (local [l w h] (tonumber (f) (f) (f) ))
  (+= sqftPaper (+ (surface-area l w h) (let [[a b] (min2 [l w h])] (area a b)))))

(print "Day 02 Part A Solution:" sqftPaper)


(tonumber :1 :2 :3)
