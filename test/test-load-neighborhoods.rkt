#lang racket

(require "assert.rkt")
(require "../lib/load-neighborhoods.rkt")

;(load_neighborhoods "two-neighborhoods.txt")


(assert "parse_lat_long pulls a number list out of a string" (equal?
  (parse_lat_long "       -85.6456921357062,42.8856213869937   ")
  (list -85.6456921357062 42.8856213869937)))

(assert "sanitize_name pulls name from standard name header"
  (equal? (sanitize_name "      King Roanoak:") "King Roanoak"))

(define parsed_hoods  (load_neighborhoods "test/three-neighborhoods.txt"))

(assert "parsing test neighborhood file returns 3 objects"
  (equal? 3 (length parsed_hoods)))

(assert "first of each elements are names"
  (equal?
    (map first parsed_hoods)
    '("Southwest" "West Grand" "ken-O-Sha Park")))
