#!/usr/bin/env racket

;; To convert this program to exe
;; $ raco exe c01.rkt

#lang racket

(define (extract str)
  (substring str 4 7))

(extract "hello, world")

(extract "the cat out of the bag!")
