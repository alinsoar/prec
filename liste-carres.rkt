

;; Énoncé

;; [liste-carres] Liste des carrés d'une liste de nombres

;; Écrire une fonction nommée liste-carres qui prend une liste de
;; nombres et qui rend la liste des carrés de ces nombres. Ainsi
;; (liste-carres (list 1 2.5 6)) donne (1 6.25 36). Vous devez
;; utiliser la fonctionnelle map pour ce faire.



;;; list(int) -> list(int)
(define (liste-carres L)
  (define (f x) (* x x))
  (map (lambda (x) (* x x)) L) )

(liste-carres '(2 3 4))


(verifier liste-carres
	  (liste-carres '()) => ()
	  (liste-carres '(1 2.5 6)) => (1 6.25 36)
	  )


