
;; Énoncé

;; [somme-chiffres] Somme des chiffres d'un nombre, nombre des
;; chiffres d'un nombre, existence d'un chiffre dans un nombre

;; Écrire une fonction nommée somme-des-chiffres qui prend un entier
;; naturel n et rend la somme des chiffres composant son écriture en
;; base décimale. Ainsi (somme-des-chiffres 31) vaut 4 puisque 31 est
;; formé des chiffres 3 et 1. La valeur de (somme-des-chiffres 987)
;; est 24 puisque 24 est la somme des chiffres 9, 8 et 7 composant le
;; nombre 987.

;; Écrire une fonction nommée nombre-de-chiffres qui prend un entier
;; naturel n et rend le nombre de chiffres significatifs composant son
;; écriture en base décimale. Ainsi 3 est la valeur de
;; (nombre-de-chiffres 196) (car 196 s'écrit avec 3 chiffres) et 4 la
;; valeur de (nombre-de-chiffres 2013) puisque 2013 s'écrit avec 4
;; chiffres.

;; Écrire un prédicat nommé existe-chiffre? qui prend un chiffre c et
;; un entier naturel n et qui vérifie que c apparaît dans l'écriture
;; de n en base décimale. Ainsi (existe-chiffre? 0 102) est-il vrai (0
;; apparaît bien dans 102) ce que n'est pas (existe-chiffre? 3 102)
;; car 3 n'apparaît pas dans 102.




;;; int -> int
(define (somme-des-chiffres n)
  (if (< n 10)
      n
      (let ((rem (remainder n 10)))
	(let ((rest (/ (- n rem) 10)))
	  (+ rem (somme-des-chiffres rest))))))

(verifier somme-des-chiffres
	  (somme-des-chiffres 1) => 1
	  (somme-des-chiffres 1113) => 6
	  )



;;; int -> int
(define (nombre-de-chiffres n)
  (if (< n 10)
      1
      (let ((rem (remainder n 10)))
	(let ((rest (/ (- n rem) 10)))
	  (+ 1 (nombre-de-chiffres rest))))))

(verifier nombre-de-chiffres
	  (nombre-de-chiffres 1) => 1
	  (nombre-de-chiffres 12113) => 5
	  )

;;; int -> bool
(define (existe-chiffre? c n)
  (cond ((< n 10) (= n c))
	(else (let ((rem (remainder n 10)))
		(let ((rest (/ (- n rem) 10)))
		  (or (= rem c)
		      (existe-chiffre? c rest)))))))

(verifier  existe-chiffre?
	  (existe-chiffre? 3 10) => #f
	  (existe-chiffre? 3 11134) => #t
	  )
