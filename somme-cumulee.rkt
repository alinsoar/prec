
;; Énoncé

;; [somme-cumulee] Somme cumulée

;; Écrire une fonction nommée somme-cumulee qui prend une liste de
;; nombres L et calcule une liste dont le premier terme est égal à la
;; somme des termes de L, dont le second terme est égal à la somme des
;; termes de (cdr L) etc. et dont le dernier terme est égal au dernier
;; terme de L. Ainsi (somme-cumulee (list 4)) rend (4) et
;; (somme-cumulee (list 3 4)) rend (7 4) et (somme-cumulee (list 2 3
;; 4)) rend (9 7 4).

;; On prendra garde de ne parcourir la liste L qu'une seule et unique
;; fois. Un de mes tests est, en effet, une très longue liste qui
;; pourrait induire votre programme à outrepasser la durée maximale
;; permise pour cet exercice.





(define (somme-cumulee L)
  (define (somme l)
    (if (pair? l)
	(+ (car l) (somme (cdr l)))
	0))

  (define (rec l)
    (if (pair? l)
	(cons (somme l) (rec (cdr l)))
	'()))
  
  (rec L))

(verifier somme-cumulee
	  (somme-cumulee (list 3 4)) => (7 4)
	  (somme-cumulee '()) => ()
	  (somme-cumulee '(1)) => (1)
	  )


