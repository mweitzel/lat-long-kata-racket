#lang racket

(define (within_bounds? point boundaries)
  (write point) (newline)
  )


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
; a '(x y x y)    x1 y1 x2 y2
; b '(x y x y)    x3 y3 x4 y4
;
; we will use:
;       (b3 - b1)(a2 - b2) - (b4 - b2)(a1 - b1)
; ua =  ---------------------------------------
;       (b4 - b2)(a3 - a1) - (b3 - b1)(a4 - a2)
;
;       (a3 - a1)(a2 - b2) - (a4 - a2)(a1 - b1)
; ub =  ---------------------------------------
;       (b4 - b2)(a3 - a1) - (b3 - b1)(a4 - a2)


; here I expect data to be  '(ax1 ay1 ax2 ay2) '(bx1 by1 bx2 by2)
; essentially flipping all 
; even though article labels suggest '(ax1 ax2 ay1 ay2) '(bx1 bx2 by1 by2), which we don't use

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

(define (_denomenator a b) ; (b4 - b2)(a3 - a1) - (b3 - b1)(a4 - b2)
  (-
    (*
      (- (fourth b) (second b))
      (- (third a) (first a)))
    (*
      (- (third a) (first b))
      (- (fourth a) (second a)))))


(provide within_bounds?)
(provide ua_numerator)
(provide ub_numerator)
(provide _denomenator)
