#!/usr/bin/env racket

#lang racket

(define (extract str)
  (substring str 4 7))

(extract "hello, world")

(extract "the cat out of the bag!")
