
;; Énoncé

;; [somme-liste] Somme des termes d'une liste

;; Écrire une fonction nommée somme-liste qui prend une liste de
;; nombres et rend la somme de ces nombres. Par convention, la somme
;; d'une liste vide est zéro. Ainsi (somme-liste (list 5 1 2)) a pour
;; valeur 8.

;; Écrire une fonction nommée somme-liste-carres qui prend une liste
;; de nombres et rend la somme des carrés de ces nombres. Par
;; convention, la somme d'une liste vide est zéro. Ainsi
;; (somme-liste-carres (list 5 1 2)) a pour valeur 30.

;; Écrire une fonction nommée moyenne-liste qui prend une liste de
;; nombres et rend la moyenne de ces nombres. Cette fonction signalera
;; une erreur lorsque la liste est vide. Ainsi (moyenne-liste (list
;; 5.6 1 1.4)) a pour valeur (approximative) 2.66.



(define (somme-liste l)
  (if (pair? l)
      (+ (car l) (somme-liste (cdr l)))
      0))


(define (somme-liste-carres l)
  (if (pair? l)
      (+ (* (car l) (car l))
	 (somme-liste-carres (cdr l)))
      0))

;;; pour grader, il faut remplacer error par erreur, et il ne faut pas
;;; l'introduire dans les testes, car 'verifier ne marche pas avec
;;; cela.
(define (moyenne-liste l)
  (define (rec l s n)
    (if (pair? l)
	(rec (cdr l)
	     (+ (car l) s)
	     (+ n 1))
	(/ s n)))
  (if (pair? l)
      (rec l 0 0)
      (error "la liste est vide")))

(verifier moyenne-liste
	  (moyenne-liste '(5.6 1 1.4) ) => 2.66666
	  (moyenne-liste '() ) => err
	  (moyenne-liste '(1) ) => 1
	  )

(verifier somme-liste
	  (somme-liste '()) => 0
	  (somme-liste '(1)) => 1
	  (somme-liste '(1 2)) => 3
	  )

(verifier somme-liste-carres
	  (somme-liste-carres '() ) => 0
	  (somme-liste-carres '(2)) => 4
	  (somme-liste-carres '(-2 -3)) => 13
	  )

