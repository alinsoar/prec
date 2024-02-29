
;; Énoncé

;; [somme-carres] Somme des carrés de 1 à n

;; Écrire une fonction nommée somme-carres qui prend un entier naturel
;; n strictement positif et qui calcule la somme des carrés des
;; entiers de 1 à n. Ainsi (somme-carres 4) est égal à 1 + 4 + 9 + 16
;; c'est-à-dire 30.


;;; int -> int
;;; 
(define (somme-carres n)
  (if (= n 1)
      1
      (+ (* n n) (somme-carres (- n 1)))))

(verifier somme-carres
	  (somme-carres 1) => 1
	  (somme-carres 4) => 30
	  (somme-carres 1000) => 333833500
	  )

