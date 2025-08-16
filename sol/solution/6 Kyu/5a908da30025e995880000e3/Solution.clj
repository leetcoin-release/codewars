;; 
;; Solution
;;
(ns kata.core)
(defn prime? [n]
  (cond
    (< n 2) false
    (= n 2) true
    (even? n) false
    :else (let [limit (Math/sqrt n)]
            (not-any? #(zero? (mod n %))
                      (range 3 (inc (int limit)) 2)))))
(def prime-chars
  (mapcat seq (map str (filter prime? (iterate inc 2)))))
(defn solve [a b]
  (->> prime-chars
       (drop a)
       (take b)
       (apply str)))





;
; Sample Tests
;
(ns kata.core-test
  (:require [clojure.test :refer :all]
            [kata.core :refer :all]))
(defn dotest [a b ans]
  (is (= (solve a b) ans)))
(deftest Example-tests
  (testing "Basic Tests"     
    (dotest  2, 2, "57")
    (dotest  10, 5, "19232")  
    (dotest  10, 3, "192")
    (dotest  20, 9, "414347535")
    (dotest  40, 8, "83899710")
    (dotest  10000, 5, "02192")
    (dotest  20000, 5, "09334")
))