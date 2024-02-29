
;; Énoncé

;; [ab-hauteur] Hauteur d'un arbre binaire

;; On rappelle que la hauteur d'un arbre binaire est égale au nombre
;; de noeuds sur la plus longue branche de l'arbre. Écrire la
;; spécification et une définition Scheme de la fonction ab-hauteur
;; qui, étant donné un arbre binaire calcule la hauteur de cet
;; arbre. Ainsi

;; (ab-hauteur (ab-vide))
;; rend 0 et
;; (ab-hauteur
;;  (ab-noeud 2
;;     (ab-vide)
;;     (ab-noeud 3
;;        (ab-vide)
;;        (ab-vide) ) ) )
;; rend 2

(load "arbre-binaire.rkt")

(define (ab-hauteur ab)
  (if (ab-vide? ab)
      0
      (+ 1
         (max (ab-hauteur (ab-gauche ab))
              (ab-hauteur (ab-droit ab))))))

(verifier ab-hauteur
          (ab-hauteur (ab-vide)) => 0

          (ab-hauteur
           (ab-noeud 2
                     (ab-vide)
                     (ab-noeud 3
                               (ab-vide)
                               (ab-vide) ) ) ) => 2
          )




