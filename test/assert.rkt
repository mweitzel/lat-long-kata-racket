#lang racket

(define (assert message b)
  (list (or b (raise (error message b))) message))

(define (refute message b)
  (list (and b (raise (error message b))) message))

(provide assert)
(provide refute)
