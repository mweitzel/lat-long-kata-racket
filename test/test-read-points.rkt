#lang racket

(require "assert.rkt")
(require "../lib/read-points.rkt")

(assert "parse_point gives lat lon list"
  (equal?
    '(" Point 5" (-85.684714 42.955808))
    (parse_point " Point 5: -85.684714,42.955808  " )))

(assert "can read frm file"
  (equal? (list -85.646282 42.912051)
  (second (first (read_points "test/points.txt")))))


