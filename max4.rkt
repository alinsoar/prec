
;; Énoncé

;; [max4] Trouver le plus grand de 4 nombres.

;; Écrire une fonction nommée le-plus-grand qui prend quatre nombres
;; et renvoie le plus grand des quatre. Ainsi, (le-plus-grand 4 7 3 1)
;; renvoie 7.

;; Nota: la fonction max n'est pas disponible.


;;; Nombre * Nombre * Nombre * Nombre -> Nombre
;;; (le-plus-grand x y z t) rend le plus grand nombre parmi x, y, z et t.
(define (le-plus-grand x y z t)
  (if (> x y)				; x y z t
      (if (> x z) 			; x z t
	  (if (> x t) x t)		; x t
	  (if (> z t) z t)		; z t
	  )
      (if (> y z)			; y z t
	  (if (> y t) y t)		; y t
	  (if (> z t) z t)		; z t
	  )))


(verifier le-plus-grand
	  (le-plus-grand 1 0  2  1) => 2
	  (le-plus-grand 1 0  2  3) => 3
	  (le-plus-grand 1 0 -1 -1) => 1
	  (le-plus-grand 1 0 -1  2) => 2
	  (le-plus-grand 0 1  2 -1) => 2
	  (le-plus-grand 0 1  2  3) => 3
	  (le-plus-grand 0 1 -1 -2) => 1
	  (le-plus-grand 0 1 -1  2) => 2
 )


