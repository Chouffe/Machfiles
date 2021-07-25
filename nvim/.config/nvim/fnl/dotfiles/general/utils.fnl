(module dotfiles.general.utils)

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

;; TODO: remove
(defn fib [n]
  (if (< n 2)
    n
    (+ (fib (- n 1)) (fib (- n 2)))))

