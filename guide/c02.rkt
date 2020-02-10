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
