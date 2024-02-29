;; Énoncé

;; [equation] Déterminer le nombre de racines réelles d'une équation
;; définie par trois coefficients.

;; Écrire une fonction nommée nombre-racines-reelles qui prend trois
;; coefficients entiers a, b et c et qui calcule le nombre de racines
;; réelles que possède l'équation axx + bx + c = 0. Ces coefficients
;; peuvent être nuls mais au moins l'un d'entre eux ne l'est pas (en
;; particulier, a peut être nul).

;; On pourra regarder comment résoudre une équation du premier degré
;; ou du second degré.


;;; Entier * Entier * Entier -> Entier
;;; (nombre-racines-reelles a b c) rend le nombre de racines réelles que 
;;; possède l'équation axx + bx + c = 0. Attention a et b peuvent être nuls.
;;; HYPOTHESE: a=b=c=0 est exclus
(define (nombre-racines-reelles a b c)
  (if (= a 0)
      (if (= b 0)
	  0
	  1)
      (if (> (- (* b b) (* 4 a c))
	     0)
	  2
	  (if (< (- (* b b) (* 4 a c))
		 0)
	      0
	      1 ))))


(verifier nombre-racines-reelles
	  (nombre-racines-reelles 0 0 2)  => 0
	  (nombre-racines-reelles 0 1 2)  => 1
	  (nombre-racines-reelles 1 0 0)  => 1
	  (nombre-racines-reelles 1 1 1)  => 0
	  (nombre-racines-reelles 1 0 -1) => 2
	  )
