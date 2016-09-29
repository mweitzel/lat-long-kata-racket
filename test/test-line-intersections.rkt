#lang racket

(require "assert.rkt")
(require "../lib/line-intersections.rkt")

(define list_a '(0 0 1 1))
(define list_b '(0 1 1 0))
(define list_c '(2 2 3 3))
(define list_d '(4 4 5 5))

(assert "ua_numerator a b" (equal? -1 (ua_numerator list_a list_b)))
(assert "ub_numerator a b" (equal? -1 (ub_numerator list_a list_b)))
(assert "_denomenator a b" (equal? -2 (_denomenator list_a list_b)))

(assert "ua_numerator is 0 for coincident lists" (equal? 0 (ua_numerator list_a list_a)))
(assert "ub_numerator is 0 for coincident lists" (equal? 0 (ub_numerator list_a list_a)))
(assert "_denomenator is 0 if lists are parallel" (equal? 0 (_denomenator list_a list_a)))

(assert "ua_numerator c d" (equal? 0 (ua_numerator list_c list_d)))
(assert "ub_numerator c d" (equal? -4 (ub_numerator list_c list_d)))
(assert "_denomenator c d" (equal? 0 (_denomenator list_c list_d)))

(assert "between_0_1 0" (between_0_1 0))
(assert "between_0_1 1" (between_0_1 1))
(refute "between_0_1 -1" (between_0_1 -1))
(refute "between_0_1 2" (between_0_1 2))

(assert "a and b intersect" (lines_intersect? list_a list_b))
(refute "a and c don't intersect" (lines_intersect? list_a list_c))
(refute "c and d don't intersect" (lines_intersect? list_c list_d))
(assert "more intersections 1" (lines_intersect? '(0 0 1 1)   '(0 1 1 0)))  ; little x
(assert "more intersections 2" (lines_intersect? '(10 0 0 10) '(0 0 10 10)));    big X
