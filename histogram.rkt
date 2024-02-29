
;; Énoncé

;; [histogram] Comptage de symboles

;; Écrire une fonction nommée histogram qui prend une liste de
;; symboles, compte leurs occurrences et rend une A-liste contenant
;; pour chaque symbole son nombre d'occurrences. Ainsi (histogram '(a
;; b c a b d b)) rend ((a 2)(b 3)(c 1)(d 1)). Nota: l'ordre des
;; associations dans la A-liste est libre.


(define (histogram L)
  (define (add-el e l)
    (cond ((and (pair? l) (equal? (caar l) e))
	   (cons (list e (+ 1 (cadar l))) (cdr l)))
	  ((pair? l) (cons (car l) (add-el e (cdr l))))
	  (else (list (list e 1)))))
  (define (rec l val)
    (if (pair? l)
	(rec (cdr l) (add-el (car l) val))
	val))
  (rec L '()))

(verifier histogram
	  (histogram '() ) => ()
	  (histogram '(a)) => ((a 1))
	  (histogram '(a b c a b d b)) => ((a 2)(b 3)(c 1)(d 1))
	  )


