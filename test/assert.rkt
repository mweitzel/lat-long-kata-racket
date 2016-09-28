#lang racket

(define (assert message b)
  (or b (raise (error message b))))

(define (refute message b)
  (assert (not b) message))

(provide assert)
(provide refute)
