#lang racket

(define (assert message b)
  (or b (raise (error message b))))

(define (refute message b)
  (and b (raise (error message b))))

(provide assert)
(provide refute)
