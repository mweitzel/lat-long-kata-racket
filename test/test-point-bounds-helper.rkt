#lang racket

(require "assert.rkt")
(require "../lib/point-bounds-helper.rkt")

; (assert "finds point is within a square"
;   (within_bounds?
;     '(1 1)
;     '('(0 0) '(0 2) '(2 2) '(2 0))))

; (refute "finds point is outside a square"
;   (within_bounds?
;     '(-1 -1)
;     '('(0 0) '(0 2) '(2 2) '(2 0))))

(define list_a '(0 0 1 1))
(define list_b '(0 1 1 0))
(define list_c '(2 2 3 3))
(define list_d '(4 4 5 5))

(assert "ua_numerator" (equal? -1 (ua_numerator list_a list_b)))
(assert "ub_numerator" (equal? -1 (ub_numerator list_a list_b)))
(assert "_denomenator" (equal? -2 (_denomenator list_a list_b)))
(assert "ua_numerator is 0 for coincident lists" (equal? 0 (ua_numerator list_a list_a)))
(assert "ub_numerator is 0 for coincident lists" (equal? 0 (ub_numerator list_a list_a)))
(assert "_denomenator is 0 if lists are parallel" (equal? 0 (_denomenator list_a list_a)))

(assert "between_0_1 0" (between_0_1 0))
(assert "between_0_1 1" (between_0_1 1))
(refute "between_0_1 -1" (between_0_1 -1))
(refute "between_0_1 2" (between_0_1 2))

(assert "a and b intersect" (lines_intersect? list_a list_b))
(refute "a and c don't intersect" (lines_intersect? list_a list_c))
(refute "c and d don't intersect" (lines_intersect? list_c list_d))

(assert "boundary list produces list of lines"
  (equal?
    (lines_from_boudaries
      (list '(1 1) '(2 2) '(3 4) '(5 5)))
    (list
        (list 1 1 2 2)
        (list 2 2 3 4)
        (list 3 4 5 5)
        (list 5 5 1 1))))
