#lang racket

(define (assert bool message)
  (or bool (raise (error message bool))))

(provide assert)
