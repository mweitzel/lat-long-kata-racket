#lang racket

(require "lib/load-neighborhoods.rkt")
(require "lib/point-bounds-helper.rkt")
(require "lib/read-points.rkt")

(define neighborhoods (load_neighborhoods "gr_neighborhoods.txt"))
(define test_file (stream-first (sequence->stream (current-command-line-arguments))))

; super hacky, but the only way I could find to have a return value consistently not print
(define (silence obj)
  (or (void) obj))

(define (neighborhood_for_point point)
  (define found
    (findf
      (lambda (neighborhood)
        (within_bounds? point (car (cdr neighborhood))))
      neighborhoods
    ))
  (if found
    (car found)
    "<none>"))

(silence
  (map
    (lambda (str)
      (printf "~a\n" str))
    (map
      (lambda (point_tuple)
        (apply string-append point_tuple))
      (map
        (lambda (point_tuple)
          (list (first point_tuple) ": " (neighborhood_for_point (second point_tuple))))
        (read_points test_file)))))
