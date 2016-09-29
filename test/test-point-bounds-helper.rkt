#lang racket

(require "assert.rkt")
(require "../lib/point-bounds-helper.rkt")

(assert "finds point is within a square"
  (within_bounds?
    '(1 1)
    (list '(0 0) '(0 2) '(2 2) '(2 0))))

(refute "finds point is outside a square"
  (within_bounds?
    '(-1 -1)
    (list '(0 0) '(0 2) '(2 2) '(2 0))))

(assert "point is within bounds"
  (within_bounds?                                           ;   1---------4
    (list 0.5 -0.2)                                         ;   |         |
    (list '(-1 -1) '(-1 1) '(1 1) '(1 -1))))                ;   |    O----+-O
;            1        2       3      4                      ;   |         |
                                                            ;   2---------3
(assert "line leaving box gives 1 intersection"
  (equal? 1                                                 ;   1---------4
  (intersects_n_times                                       ;   |         |
    (list 0.5 -0.2 4 4)                                     ;   |    O----+-O
    (lines_from_boudaries                                   ;   |         |
      (list '(-1 -1) '(-1 1) '(1 1) '(1 -1))))))            ;   2---------3
;            1        2       3      4

(assert "line going through box gives 2 intersections"
  (equal? 2                                                 ;   1---------4
    (intersects_n_times                                     ;   |         |
      (list -20 0 20 0)                                     ; 0-+---------+--0
      (lines_from_boudaries                                 ;   |         |
        (list '(-10 -10) '(-10 10) '(10 10) '(10 -10))))))  ;   2---------3

(assert "line going through convext box gives 4 intersections"
  (equal? 4                                                 ;   1----------8
    (intersects_n_times                                     ;   |          |
      (list -1 1 10 1)                                      ;   |   4--5   |
      (lines_from_boudaries                                 ; 0-+---+--+---+--0
        (list '(0 0) '(0 3) '(3 3) '(3 1)                   ;   |   |  |   |
              '(4 1) '(4 3) '(5 3) '(5 0))))))              ;   2---3  6---7

(assert "line going through convext box gives 4 intersections"
  (equal? 3                                                 ;   1----------8
    (intersects_n_times                                     ;   |          |
      (list 2 1 10 1)                                       ;   |   4--5   |
      (lines_from_boudaries                                 ;   | 0-+--+---+--0
        (list '(0 0) '(0 3) '(3 3) '(3 1)                   ;   |   |  |   |
              '(4 1) '(4 3) '(5 3) '(5 0))))))              ;   2---3  6---7

(assert "boundary list produces list of lines"
  (equal?
    (lines_from_boudaries
      (list '(1 1) '(2 2) '(3 4) '(5 5)))
    (list
        (list 1 1 2 2)
        (list 2 2 3 4)
        (list 3 4 5 5)
        (list 5 5 1 1))))

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
