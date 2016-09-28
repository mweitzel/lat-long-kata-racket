#lang racket

(require "assert.rkt")
(require "../lib/point-bounds-helper.rkt")

(assert "finds point is within a square"
  (within_bounds?
    '(1 1)
    '('(0 0) '(0 2) '(2 2) '(2 0))))
