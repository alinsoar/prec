
;; Énoncé

;; [puissancecomp] Calculer la complexité de la fonction puissance

;; Écrire une fonction nommée puissancecomp qui prend en arguments un
;; nombre x et un entier naturel n et rend le nombre de
;; multiplications à effectuer pour calculer x à la puissance n avec
;; la définition suivante de la fonction puissance:

;;; puissanceLent : Nombre * nat -> Nombre
;;; HYPOTHESE n est un entier positif ou nul
;;; (puissanceLent x n) rend x a la puissance n
(define (puissanceLent x n)
  (if (= n 0)
      1
      (if (even? n)
          (* (puissanceLent x (quotient n 2))
             (puissanceLent x (quotient n 2)))
          (* x 
             (puissanceLent x (quotient n 2))
             (puissanceLent x (quotient n 2))))))

;; Attention: un appel à la fonction de multiplication avec 3
;; arguments (comme (* 3 4 5) représente 2 multiplications. Ainsi,
;; (puissancecomp x 0) vaut toujours 0 (aucune multiplication) et
;; (puissancecomp x 1) vaut toujours 2 correspondant à au calcul de (*
;; x 1 1).

;;; int*int -> int
(define (puissancecomp x n)
  (if (= n 0)
      0
      (if (even? n)
	  (let ((p (puissancecomp x (quotient n 2))))
	    (+ 1 (* 2 p)))
	  (let ((p (puissancecomp x (quotient n 2))))
	    (+ 2 (* 2 p))))))

(verifier puissancecomp
	  (puissancecomp 1 1) => 2
	  (puissancecomp 2 2) => 5
	  )


