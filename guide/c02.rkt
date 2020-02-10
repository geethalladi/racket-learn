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
