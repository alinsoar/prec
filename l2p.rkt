
;; Énoncé

;; [l2p] Deux premiers termes d'une liste

;; Écrire une fonction nommée l2p qui prend une liste d'au moins deux
;; termes et qui construit une liste contenant exactement ces deux
;; premiers termes (dans le même ordre). Ainsi, (l2p (list "a" "b"
;; "cd")) a pour valeur ("a" "b").

;;; List[alpha] -> List[alpha]
(define (l2p items)
  (cons (car items)
	(cons (car (cdr items)) '())))

(verifier l2p
	  (l2p (list "a" "b" "cd")) => ("a" "b")
	  (l2p (list "0" "1")) => ("0" "1")
	  )



