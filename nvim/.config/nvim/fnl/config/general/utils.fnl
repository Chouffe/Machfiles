(module config.general.utils)

(defn empty? [x]
  (or (= x nil) (= x "") (= x 0)))

(comment
  ;; Empty values
  (empty? nil)
  (empty? "")
  (empty? 0)

  ;; Non empty values
  (empty? 1)
  (empty? [])
  (empty? 42))
