(local a (require :aniseed.core))

(fn reverse [coll]
  "Returns a collection of the items in coll in reverse order."
  (if (a.empty? coll)
    coll
    (a.concat
      (reverse (a.rest coll))
      [(a.first coll)])))

(comment
  (reverse [1 2 3 4]))

(fn take-while [pred coll]
  "Returns a coll of successive items from coll while
  (pred item) returns logical true. pred must be free of side-effects."
  (. (a.reduce (fn [{: ys : done?} x]
                 (if
                   done? {:ys ys :done? true}
                   (pred x) {:ys (a.concat ys [x]) :done? false}
                   :else {:ys ys :done? true}))
            {:done? false :ys []}
            coll)
     :ys))

(comment
  (take-while a.string? ["hello" "world" 42 43]))

  ;; Insert in a table
; (comment
;   (let [t [1 2 3]]
;     (table.insert t 4)
;    t))

(local deep-merge (partial vim.tbl_deep_extend "keep"))

{: reverse
 : take-while
 : deep-merge}
