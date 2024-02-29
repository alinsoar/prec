;; Énoncé

;; [aire-couronne] Calcul de l'aire d'une couronne.

;; Écrire une fonction nommée aire-couronne qui prend en arguments un
;; rayon extérieur r1 et un rayon intérieur r2 et qui calcule l'aire
;; de la couronne située entre ces deux rayons. Pour cette question,
;; on supposera que r1 est plus grand que r2. Une valeur approximative
;; de Pi (3.141592653589793) est déjà définie.

;; On pourra s'aider d'une fonction aire-disque calculant l'aire d'un
;; disque de rayon r.


;; Nombre -> Nombre
(define (aire-disque r)
  (* pi r r))

;;; aire-couronne : Nombre/>=0/ * Nombre/>=0/ -> Nombre
;;; (aire-couronne r1 r2) rend l'aire d'une couronne de
;;; rayon exterieur r1 et de rayon interieur r2
;;; HYPOTHESE: r1 > r2
(define (aire-couronne r1 r2)
  (- (aire-disque r1) (aire-disque r2)))

(verifier aire-couronne
	  (aire-couronne 1 0)  => 3.141592653589793 
	  (aire-couronne 0 0 ) => 0
	  (aire-couronne 3 1 ) => 25.132741228718345
	  )




