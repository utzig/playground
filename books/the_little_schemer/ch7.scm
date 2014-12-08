(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else (set? (cdr lat))))))

(define makeset
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((member? (car lat) (cdr lat))
        (makeset (cdr lat)))
      (else (cons (car lat) (makeset (cdr lat)))))))

(define subset?
  (lambda (set1 set2)
      (cond
        ((null? set1) #t)
        (else (and (member? (car set1) set2) (subset? (cdr set1) set2))))))

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2) (subset? set2 set1))))

(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      (else (or (member? (car set1) set2) (intersect? (cdr set1) set2))))))

(define intersect
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      (else (cond
        ((member? (car set1) set2) (cons (car set1)
                                         (intersect (cdr set1) set2)))
        (else (intersect (cdr set1) set2)))))))

(define union
  (lambda (set1 set2)
    (cond
      ((null? set1) set2)
      ((member? (car set1) set2) (union (cdr set1) set2))
      (else (cons (car set1) (union (cdr set1) set2))))))

(define intersectall
  (lambda (l-set)
    ((null? (cdr l-set)) (car l-set))
    (else (intersect (car l-set) (intersectall (cdr l-set))))))

(define a-pair?
  (lambda (l)
    ((null? l) #f)
    ((null? (cdr l)) #f)
    ((null? (cdr (cdr l))) #t)
    (else #f)))

(define first (lambda (l) (car l)))
(define second (lambda (l) (car (cdr l))))
(define third (lambda (l) (car (cdr (cdr l)))))
(define build (lambda (s1 s2) (cons s1 (cons s2 '()))))

; (include "ch3.scm")

(define fun? (lambda (rel) (set? (firsts rel))))

(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else (cons
        (build (second (car rel)) (first (car rel)))
          (revrel (cdr rel)))))))
