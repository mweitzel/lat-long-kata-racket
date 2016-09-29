#lang racket

(require "line-intersections.rkt")

; odd intersections mean its within the bounds
; see https://en.wikipedia.org/wiki/Point_in_polygon#Ray_casting_algorithm

(define (within_bounds? point boundaries)
  (equal? 1
    (modulo
      (intersects_n_times (append point faraway) (lines_from_boudaries boundaries))
      2 )))

(define faraway (list 10000000000000 100000000000000))

(define (lines_from_boudaries boundaries)
  ((lambda (wrapped_boundaries)
    (build-list
      (length boundaries)
      (lambda (n)
        (append
          (car (list-tail wrapped_boundaries n))
          (car (list-tail wrapped_boundaries (+ 1 n)))))))
  (wrap_boundaries boundaries)))

(define (wrap_boundaries boundaries) ; tack first element on end
  (append boundaries (list (car boundaries))))

(define (intersects_n_times line lines_to_check)
  (length
    (filter
      (lambda (check_line) (lines_intersect? check_line line))
      lines_to_check)))

(provide within_bounds?)
(provide lines_from_boudaries)
(provide intersects_n_times)
