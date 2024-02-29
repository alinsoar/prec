;; Énoncé

;; [interet] Calcul d'intérêts et de capital

;; Écrire une fonction nommée valeur-capital qui prend un capital k,
;; un taux d'intérêt t et un nombre d'années n et qui calcule le
;; n-ième terme de la suite définie comme:

;;     C(0) = k
;;     C(n+1) = C(n) + t*C(n)

;; C'est-à-dire la valeur d'un capital k placé à un taux t au bout
;; d'un nombre n d'années.  Écrire une fonction nommée valeur-epargne
;; qui prend un versement annuel A, un taux d'intérêt t et un nombre
;; d'années n et qui calcule le n-ième terme de la suite définie
;; comme:

;;     C(0) = A
;;     C(n+1) = A + C(n) + t*C(n)

;; C'est-à-dire la valeur d'une épargne annuelle A placée à un taux t
;; au bout d'un nombre n d'années.

;; Attention, la question qui suit ne correspond pas à une récursion
;; classique!

;; Écrire une fonction nommée duree-doublement qui prend un capital
;; initial k, un taux d'intérêt t strictement positif et qui calcule
;; le nombre d'années permettant de doubler le capital initial. Ainsi
;; (duree-doublement 1000 0.01) rend 70: il faut 70 ans pour doubler
;; un capital quelconque placé à 1%.



(define (valeur-capital k t n)
  (if (= n 0)
      k
      (let ((v (valeur-capital k t (- n 1))))
	(+ v (* t v)))))

(verifier valeur-capital
	  (valeur-capital 1 1 0) => 1
	  (valeur-capital 1 1 1) => 2
	  )



(define (valeur-epargne A t n)
  (if (= n 0)
      A
      (let ((v (valeur-epargne A t (- n 1))))
	(+ A v (* t v)))))

(verifier valeur-epargne
	  (valeur-epargne 1 1 1) => 3
	  (valeur-epargne 1 1 0) => 1
	  )

(define (duree-doublement k t)
  (define (rec v v0 n)
    (if (> v v0)
	n
	(rec (+ v (* t v))
	     v0
	     (+ n 1))))
  (rec k (* 2 k) 0))

(verifier duree-doublement
	  (duree-doublement 1000 .01) => 70
	  (duree-doublement 1 .01) => 70
	  (duree-doublement 3 .001) => 694
	  )


