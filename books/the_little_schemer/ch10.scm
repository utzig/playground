(define first (lambda (l) (car l)))
(define second (lambda (l) (car (cdr l))))

(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
      (first entry)
      (second entry)
      entry-f)))

(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
      ((null? names) (entry-f name))
      ((eq? (car names) name)
        (car values))
      (else (lookup-in-entry-help name
              (cdr names) (cdr values) entry-f)))))

; example usage
(lookup-in-entry 'entree '((appetizer entree beverage) (food tastes good)) (lambda (name) #f))
(lookup-in-entry 'notfound '((appetizer entree beverage) (food tastes good)) (lambda (name) #f))

(define lookup-in-table
  (lambda (name table table-f)
    (cond
      ((null? table) (table-f name))
      (else (lookup-in-entry name
            (car table)
            (lambda (name)
              (lookup-in-table name
                (cdr table)
                table-f)))))))
