#lang racket

(define (load_neighborhoods file)
  (define post_fold
    (foldl
      (lambda ( next carry )
          (cond
            [(string-contains? next ":") (handle_park_name next carry)]
            [(equal? next "") (handle_empty next carry)]
            [else (handle_lat_lon next carry)])
       )
      '(() () ())
      (file->lines file)))
    (car (cdr (cdr                   ; nab carry
      (handle_empty "" post_fold)))) ; after final restructuring (assumes no trailing newline)
  )

(define (handle_park_name next carry)
  (list
    (sanitize_name next)             ; name
    '()                              ; new empty lat lon list
    (car (cdr (cdr carry)))))        ; carry on

(define (handle_empty next carry)
  (list
    next                             ; blank name ""
    '()                              ; new empty lat lon list
    (append                          ; append current list of parks with (name, (lat lon list))
      (car (cdr (cdr carry)))
      (list (list (car carry) (car (cdr carry)))))))

(define (handle_lat_lon next carry)
  (list
    (car carry)                                              ; keep name
    (append (car (cdr carry)) (list (parse_lat_long next)))  ; stuff next lat lon in the list
    (car (cdr (cdr carry)))))                                ; carry on


(define (parse_lat_long ll_string)
  (map string->number (string-split (string-trim ll_string) ",")))

(define (sanitize_name dirty_name) (first (string-split (string-trim dirty_name) ":")))

(provide load_neighborhoods)
(provide parse_lat_long)
(provide sanitize_name)
