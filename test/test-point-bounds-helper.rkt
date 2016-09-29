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

(assert "point is within bounds"                            ;   1---------4
  (within_bounds?                                           ;   |         |
    (list 0.5 -0.2)                                         ;   |    O----+-O
    (list '(-1 -1) '(-1 1) '(1 1) '(1 -1))))                ;   |         |
;            1        2       3      4                      ;   2---------3

(refute "point is outside bounds"                           ;   1---------4
  (within_bounds?                                           ;   |         |
    (list 2 2)                                              ;   |         | O-O
    (list '(-1 -1) '(-1 1) '(1 1) '(1 -1))))                ;   |         |
;            1        2       3      4                      ;   2---------3

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
