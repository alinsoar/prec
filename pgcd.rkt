
;; Énoncé

;; [pgcd] Calcul du PGCD

;; Écrire une fonction nommée pgcd qui prend deux entiers naturels non
;; nuls m et n et rend leur plus grand commun diviseur.

;; On rappelle que si m=nq+r (division euclidienne de m par n, avec
;; comme quotient q et comme reste r inférieur strictement à n) et si
;; r>0 alors le pgcd de m et de n est aussi celui de n et de r.


;;; int*int -> int
(define (pgcd m n)
  (let ((r (remainder (max m n) (min m n))))
    (if (> r 0)
	(pgcd n r)
	(min m n))))

(verifier pgcd
	  (pgcd 1 1) => 1
	  (pgcd 12 9) => 3
	  (pgcd 101 11) => 1
	  )

