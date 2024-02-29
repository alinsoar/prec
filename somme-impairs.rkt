;; Énoncé

;; [somme-impairs] Somme des N premiers impairs.

;; Écrire une fonction nommée somme-impairs qui prend un entier
;; naturel non nul n et qui retourne la somme des n premiers entiers
;; naturels impairs: 1+3+5+...+(2n-1).



;;; somme-impairs:    int -> int
;;; (somme-impairs n) ...
;;; HYPOTHÈSE: n > 0
(define (somme-impairs n)
  (define (rec k)
    (if (= k 1)
	1
	(+ k (rec (- k 2)))))
  (rec (- (* 2 n) 1)))

(verifier somme-impairs
	  (somme-impairs 1) => 1
	  (somme-impairs 2) => 4
	  (somme-impairs 3) => 9
	  )



