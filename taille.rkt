

;; Énoncé

;; [taille] Taille d'une liste

;; Écrire un prédicat nommé lg? qui prend un entier naturel n et une
;; liste et qui vérifie que la liste a une longueur de n. La liste ne
;; doit être parcourue qu'au plus sur ses n premiers termes.


;;; ...
(define (lg? n L)
  (cond ((not (pair? L)) (= n 0))
        ((= n 0) #f)
        (else (lg? (- n 1) (cdr L)))))


(verifier lg?
          (lg? 1 '(1) ) => #t
          (lg? 0 '(1) ) => #f
          (lg? 2 '(1 2)) => #t
          )



