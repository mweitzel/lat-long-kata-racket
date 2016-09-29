#lang racket

; see http://www-cs.ccny.cuny.edu/~wolberg/capstone/intersection/Intersection%20point%20of%20two%20lines.html
; the article describes:
;       (x4 - x3)(y1 - y3) - (y4 - y3)(x1 - x3)
; ua =  ---------------------------------------
;       (y4 - y3)(x2 - x1) - (x4 - x3)(y2 - y1)
;
;       (x2 - x1)(y1 - y3) - (y2 - y1)(x1 - x3)
; ub =  ---------------------------------------
;       (y4 - y3)(x2 - x1) - (x4 - x3)(y2 - y1)

; with line segments described as '(x y x y)
; and using the following mapping to our data structures
;    our data     article convention
;                 a1 a2 a3 a4
; a '(x y x y)    x1 y1 x2 y2
; b '(x y x y)    x3 y3 x4 y4
;                 b1 b2 b3 b4

; we will use:
;       (b3 - b1)(a2 - b2) - (b4 - b2)(a1 - b1)
; ua =  ---------------------------------------
;       (b4 - b2)(a3 - a1) - (b3 - b1)(a4 - a2)
;
;       (a3 - a1)(a2 - b2) - (a4 - a2)(a1 - b1)
; ub =  ---------------------------------------
;       (b4 - b2)(a3 - a1) - (b3 - b1)(a4 - a2)

(define (lines_intersect? a b)
  ((lambda (num_a num_b denom)
    (and
      (not (equal? 0 denom)) ; parallel, also short circuit to prevent n/0 error
      (between_0_1 (/ num_a denom))  ; ua
      (between_0_1 (/ num_b denom))) ; ub
    )
    (ua_numerator a b)
    (ub_numerator a b)
    (_denomenator a b)))

(define (between_0_1 n) (and ( <= 0 n ) ( <= n 1 )))

(define (ua_numerator a b) ; (b3 - b1)(a2 - b2) - (b4 - b2)(a1 - b1)
  (-
    (*
      (- (third b) (first b))
      (- (second a) (second b)))
    (*
      (- (fourth b) (second b))
      (- (first a) (first b)))))

(define (ub_numerator a b) ; (a3 - a1)(a2 - b2) - (a4 - a2)(a1 - b1)
  (-
    (*
      (- (third a) (first a))
      (- (second a) (second b)))
    (*
      (- (fourth a) (second b))
      (- (first a) (first b)))))

(define (_denomenator a b) ; (b4 - b2)(a3 - a1) - (b3 - b1)(a4 - a2)
  (-
    (*
      (- (fourth b) (second b))
      (- (third a) (first a)))
    (*
      (- (third b) (first b))
      (- (fourth a) (second a)))))


(provide lines_intersect?)
(provide ua_numerator)
(provide ub_numerator)
(provide _denomenator)
(provide between_0_1)
