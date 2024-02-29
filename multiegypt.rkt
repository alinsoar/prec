
;; Énoncé

;; [multegypt] Multiplication égyptienne

;; Écrire une fonction nommée multegypt qui prend deux entiers
;; naturels et calcule leur produit. Vous n'avez pas le droit
;; d'utiliser la fonction de multiplication *. Voici la technique
;; utilisée, dit-on, par les égyptiens:


   1 * m = m
   2n * m = n * (m+m)
   (2n+1) * m = m + (2n * m)


(define (multegypt n m)
  (cond ((= n 1) m)
	((even? n) (multegypt (/ n 2) (+ m m)))
	(else (+ m (multegypt (- n 1) m)))))

(verifier multegypt
	  ;; (multegypt 0 1) => 0
	  ;; (multegypt 1 0) => 0
	  (multegypt 2 3) => 6
	  (multegypt 11 3) => 33
	  )





