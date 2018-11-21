(define (echo lst)
  (cond ((null? lst)
         '())
        (else
         (cons (car lst)
               (cons (car lst)
                     (echo (cdr lst)))))))

(define (echo-lots lst n)
  (cond ((null? lst)
         '())
        (else
         (append (repeat lst n)
                 (echo-lots (cdr lst) n)))))

(define (repeat lst n)
  (cond ((or (null? lst) (< n 1))
         '())
        (else
         (cons (car lst)
               (repeat lst (- n 1))))))

(define (atom? x) (and (not (null? x)) (not (pair? x))))

(define (echo-all lst)
  (cond ((null? lst) '())
        ((atom? (car lst))
         (cons (car lst)
               (cons (car lst)
                     (echo-all (cdr lst)))))
        (else
         (cons (echo-all (car lst))
                 (cons (echo-all (car lst))
                         (echo-all (cdr lst)))))))

(define (nth i lst)
  (cond ((zero? i)
         (car lst))
        (else
         (nth (- i 1) (cdr lst)))))

(define (single-flat lst)
  (cond((null? lst) '())
       (else
        (append (car lst)
                (single-flat (cdr lst))))))

(define (assoc-all keys a-list)
  (cond ((or (null? keys) (null? a-list)) '())
        (else
         (single-flat (map (lambda (x) (cdr (assoc x a-list))) keys)))))

(define (filter fn lst)
  (cond ((or (null? fn) (null? lst)) '())
        ((fn (car lst))
         (cons (car lst)
               (filter fn (cdr lst))))
        (else
         (filter fn (cdr lst)))))