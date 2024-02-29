
;; Énoncé

;; [ab-nb-noeuds] Définition de fonctions calculant différentes
;; caractéristiques des arbres binaires autour du nombre de noeuds de
;; ceux-ci.

;; Écrire la spécification et une définition du prédicat ab-vide? qui
;; étant donné un arbre binaire teste si cet arbre est vide.

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-nb-noeuds qui, étant donné un arbre binaire, calcule le nombre
;; de noeuds de cet arbre. Ainsi

;; (ab-nb-noeuds (ab-vide) )
;; rend 0 et
;; (ab-nb-noeuds (ab-noeud 2
;;                  (ab-noeud 1 (ab-vide) (ab-vide) )
;;                  (ab-vide) ) )
;; rend 2.

;; Si un noeud est à la hauteur k dans un arbre (il y a (k-1) noeuds
;; de la racine à lui même), on dit qu'il est au niveau k. Ainsi, la
;; racine d'un arbre est au niveau 1 et tout arbre non vide a un noeud
;; de niveau 1. Un noeud, fils de la racine, est au niveau 2. Un arbre
;; vide n'a aucun noeud au niveau k quelle que soit la valeur de k. Il
;; n'existe pas de niveau 0.

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-nb-noeuds-niveau qui, étant donnés un entier strictement positif
;; k et un arbre binaire A calcule le nombre de noeuds de A au niveau
;; k. Par exemple :

;; (ab-nb-noeuds-niveau 1 (ab-vide) )
;; rend 0
;; (ab-nb-noeuds-niveau 1 (ab-noeud 2
;;                           (ab-noeud 1 (ab-vide) (ab-vide) )
;;                           (ab-vide) ) )
;; rend 1
;; (ab-nb-noeuds-niveau 2 (ab-noeud 2
;;                           (ab-noeud 1 (ab-vide) (ab-vide) )
;;                           (ab-noeud 4 (ab-vide) (ab-vide) ) ) )
;; rend 2


(load "arbre-binaire.rkt")

(define (ab-vide? arbre) (not (ab-noeud? arbre)))

(verifier ab-vide?
          (ab-vide? (ab-vide) ) => #t
          (ab-vide? (ab-noeud 1 (ab-vide) (ab-vide)) ) => #f
          )


(define (ab-feuille? ab)
  (and (ab-noeud? ab)
       (ab-vide? (ab-gauche ab))
       (ab-vide? (ab-droit ab)))
  )

(verifier ab-feuille?
          (ab-feuille? (ab-vide)) => #f
          (ab-feuille? (ab-noeud 1 
                                 (ab-vide) 
                                 (ab-vide) ) ) => #t
          (ab-feuille? (ab-noeud 1 
                                 (ab-vide) 
                                 (ab-noeud 2 (ab-vide) (ab-vide)) ) ) => #f
          (ab-feuille? (ab-noeud 1 
                                 (ab-noeud 2 (ab-vide) (ab-vide)) 
                                 (ab-vide) ) ) => #f
          )

(define (ab-feuille e)
  (ab-noeud e (ab-vide) (ab-vide)))

(verifier ab-feuille
          (equal?
           (ab-feuille (ab-vide))
           (ab-noeud (ab-vide) (ab-vide) (ab-vide))
           ) => #t
          (equal? (ab-feuille (ab-noeud 2 
                                        (ab-vide) 
                                        (ab-vide) ) )
                  (ab-noeud (ab-noeud 2 (ab-vide) (ab-vide))
                            (ab-vide)
                            (ab-vide))) => #t
          )

(define (ab-nb-noeuds ab)
  (if (ab-vide? ab)
      0
      (+ (if (ab-noeud? ab) 1 0)
         (ab-nb-noeuds (ab-gauche ab))
         (ab-nb-noeuds (ab-droit ab)))))

(verifier ab-nb-noeuds
          (ab-nb-noeuds (ab-vide)) => 0
          (ab-nb-noeuds (ab-noeud 2
                                  (ab-noeud 1 (ab-vide) (ab-vide) )
                                  (ab-vide) ) ) => 2
          (ab-nb-noeuds (ab-noeud 2 
                                  (ab-vide) 
                                  (ab-noeud 3 
                                            (ab-feuille 3) 
                                            (ab-feuille 4) ) ) ) => 4
          )

(define (ab-nb-noeuds-niveau k ab)
  (define (rec n a)
    (cond ((ab-vide? ab) 0)
          ((= n k) (if (ab-noeud? a) 1 0))
          (else (+ (rec (+ n 1) (ab-gauche a))
                   (rec (+ n 1) (ab-droit a))))))
  (rec 1 ab))


(verifier ab-nb-noeuds-niveau
          (ab-nb-noeuds-niveau 1 (ab-noeud 1 (ab-feuille 1) (ab-vide))) => 1
          (ab-nb-noeuds-niveau 2 (ab-noeud 1 (ab-vide) (ab-vide))) => 0
          (ab-nb-noeuds-niveau 1 (ab-vide) ) => 0
          (ab-nb-noeuds-niveau 3 (ab-vide) ) => 0
          (ab-nb-noeuds-niveau 2 
                               (ab-noeud 1 
                                         (ab-feuille 1) 
                                         (ab-feuille 4) ) ) => 2
          (ab-nb-noeuds-niveau 1 (ab-noeud 2
                                           (ab-noeud 1 (ab-vide) (ab-vide) )
                                           (ab-vide) ) ) => 1

          (ab-nb-noeuds-niveau 2 (ab-noeud
                                  2
                                  (ab-noeud 1 (ab-vide) (ab-vide) )
                                  (ab-noeud 4 (ab-vide) (ab-vide) ) ) ) => 2
          (ab-nb-noeuds-niveau 1
                               (ab-noeud 1 
                                         (ab-feuille 1) 
                                         (ab-feuille 4) ) ) => 1
          )




