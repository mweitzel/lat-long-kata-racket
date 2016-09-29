#lang racket

(require "load-neighborhoods.rkt")

(define (read_points file)
  (foldr
    (lambda ( next carry )
      (append (list ( parse_point next )) carry))
    '()
    (file->lines file)))

(define (parse_point dirty_point)
  (list
    (first (string-split dirty_point ":"))
    (parse_lat_long (string-trim (second (string-split dirty_point ":"))))))
(provide read_points)
(provide parse_point)
