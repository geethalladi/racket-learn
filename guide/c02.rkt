#lang racket

(define pie 3)

(define (piece str)
  (substring str 0 pie))

(piece "key lime")

(define (bake flavour)
  (printf "preheating oven...\n")
  (string-append flavour " pie"))

(if (> 2 3) "hello" "world")

(define (reply s)
  (if (equal? "hello" (substring s 0 5))
      "hi"
      "huh?"))

(define (reply-more s)
  "A new function"
  (if (and (string? s)
           (>= (string-length s) 5)
           (equal? (substring s 0 5) "hello"))
      "hi"
      "huh?"))

(define (reply-mode s)
  (cond [(equal? "hello" (substring s 0 5))
         "hulo"]
        [(equal? "goodbye" (substring s 0 7))
         "tata"]
        [(equal? "?" (substring s (- (string-length s) 1)))
         "I don't know"]
        [else "thank you!"]))

(define (double x)
  "Double the input"
  ((if (string? x) string-append +) x x))


(define (twice f x)
  "Apply the function twice to the argument"
  (f (f x)))

(define (louder x)
  (string-append x "!"))

(twice louder "hello")

(twice (lambda (s) (string-append s "?!"))
       "hello")

(define (make-add-suffix s2)
  (lambda (s)
    (string-append s s2)))

(twice (make-add-suffix "?")
       "hello")

(twice (make-add-suffix "!")
       "hello")

(twice (make-add-suffix "...")
       "hello")

(define (converse s)
  (printf "Argument is ~s\n" s)
  (define (starts? s2)
    "Predicate to check if the original strings starts with the given string"
    (define len2 (string-length s2))
    (printf "Length of ~s is ~s\n" s2 len2)
    (and (>= (string-length s) len2)
         (equal? s2 (substring s 0 len2))))
  (cond
    [(starts? "hello") "hi!"]
    [(starts? "goodbye") "bye!"]
    [else "huh!"]))

(define (game)
  "Game of randomness"
  (let ([x (random 4)]
        [o (random 4)])
    (cond [(> x o) "X wins"]
          [(> o x) "O wins"]
          [else "cat's game"])))

(define (game2)
  "A better game of randomness"
  (let* ([x (random 4)]
         [o (random 4)]
         [diff (number->string (abs (- x o)))])
    (cond [(> x o) (string-append "X wins by " diff)]
          [(> o x) (string-append "O wins by " diff)]
          [else "cat's game"])))

(list "a" "b" "c")

;; extract by position
(list-ref (list "a" "b" "c") 2)

(append (list "a" "b" "c")
        '(1 2 3 4))

(reverse '(1 2 3 4))

;; returns the tail of the list from the found element
(member 4 '(1 2 3 4))

;; mapping over a list

(map sqrt (list 1 4 9 16))

;; Using lambda in map

(map (lambda (s) (string-append s "!"))
     (list "peanut" "butter" "crackerjack"))

;; andmap / ormap

(andmap string? (list "a" "b" "c"))

(andmap string? (list "a" "b" 1))

(ormap number? (list "a" "b" "c"))

(ormap number? (list "a" "b" "c" 1))

;; mapping simultaneously over two lists

(map (lambda (s n) (list s n))
     (list "a" "b" "c")
     (list 1 2 3))

(map (lambda (s n) (substring s 0 n))
     (list "peanut" "butter" "crackjack")
     (list 4 3 2))

;; filtering elements from a list

(filter string? (list 1 2 3 4 "abcd"))

(filter positive? (list 1 2 3 4 -5))

(foldl + 0 (list 0 1 2 3))

;; fold left

(foldl (lambda (x result) (* x result))
       1
       '(1 2 3 4))

(foldl (lambda (a b result) (+ result (* a b)))
       0
       '(1 2 3 4)
       '(1 2 3 4))

;; recursive definitions of length and map

(define (my-length lst)
  "My own way of computing length of the list"
  (cond [(empty? lst) 0]
        [else (+ 1 (my-length (rest lst)))]))

(define (my-map f lst)
  "My own way of implementing map function"
  (cond [(empty? lst) empty]
        [else (cons (f (first lst))
                    (my-map f (rest lst)))]))

(my-map (lambda (x) x) empty)

(my-map (lambda (x) x) '(1 2 3 4))

(my-map sqrt '(1 4 9 16))

