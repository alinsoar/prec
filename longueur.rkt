;; Énoncé

;; [longueur] Longueurs de liste

;; Écrire une fonction nommée longueur qui prend une liste et rend le
;; nombre de termes que comprend cette liste. Ainsi (longueur (list
;; "a" "bc" "d")) rend 3.

;; Écrire une fonction nommée longueur-paire? qui prend une liste et
;; vérifie qu'elle a un nombre pair de termes. Ainsi (longueur-paire?
;; (list 33 22)) est vraie tandis que (longueur-paire? (list 33)) est
;; faux.

;; Écrire une fonction nommée plus-de-3? qui prend une liste et
;; vérifie qu'elle comporte au moins trois termes.

;; Écrire une fonction nommée longueur-egale? qui prend un entier
;; naturel et une liste et vérifie que cette liste comporte exactement
;; ce nombre de termes. Ainsi (longueur-egale? 3 (list 33 44 55)) est
;; vrai tandis que (longueur-egale? 2 (list 33 44 55)) est faux tout
;; comme (longueur-egale? 3 (list 33 44 55 66)).



;;; ...
(define (longueur L)
  (if (pair? L)
      (+ 1 (longueur (cdr L)))
      0))

(verifier longueur
	  (longueur (list "a" "bc" "d")) => 3
	  (longueur (list)) => 0
	  )

(define (longueur-paire? l)
  (even? (longueur l)))

(verifier longueur-paire?
	  (longueur-paire? (list 33)) => #f
	  (longueur-paire? (list 33 22)) => #t
	  )

(define (longueur-egale? n l)
  (= n (longueur l)))

(verifier longueur-egale?
	  (longueur-egale? 3 (list 33 44 55)) => #t
	  (longueur-egale? 3 (list 33 44 55 66)) => #f
	  )


(define (plus-de-3? l)
  (>= (longueur l) 3))

(verifier plus-de-3?
	  (plus-de-3? '()) => #f
	  (plus-de-3? '(0 1)) => #f
	  (plus-de-3? '(0 1 2)) => #t
	  )

