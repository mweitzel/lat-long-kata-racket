#lang racket

(define (assert message b)
  (or b (raise (error message b))))

(provide assert)
