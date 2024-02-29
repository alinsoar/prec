
;; Énoncé

;; [ab-nb-feuilles] Définition de fonction calculant des
;; caractéristiques relatives aux feuilles des arbres binaires

;; Un arbre est une feuille s'il ne possède qu'un seul noeud. Écrire
;; la spécification et une définition du prédicat ab-feuille? qui
;; étant donné un arbre binaire teste si cet arbre est une
;; feuille. Par exemple : (ab-feuille? (ab-vide)) rend #f alors que

 
;; (ab-feuille? (ab-noeud 1 
;;                 (ab-vide) 
;;                 (ab-vide) ) )
;; rend #t.

;; Écrire la spécification et une définition de la fonction ab-feuille
;; qui étant donnée une étiquette e rend la feuille d'etiquette e.

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-nb-feuilles qui, étant donné un arbre binaire calcule le nombre
;; de feuilles de cet arbre. Ainsi, (ab-nb-feuilles (ab-vide)) rend 0
;; alors que

;; (ab-nb-feuilles (ab-noeud 2 
;;                    (ab-vide) 
;;                    (ab-noeud 3 
;;                       (ab-feuille 3) 
;;                       (ab-feuille 4) ) ) ) 
;; rend 2.

;; Si est noeud est à la hauteur k dans un arbre, on dit qu'il est au
;; niveau k. Ainsi, la racine d'un arbre est au niveau 1 et tout arbre
;; non vide a un noeud de niveau 1. Un noeuds fils de la racine est au
;; niveau 2. Un arbre vide n'a aucun noeud au niveau k quelle que soit
;; la valeur de k. Il n'existe pas de niveau 0.

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-nb-feuilles-niveau qui, étant donnés un entier strictement
;; positif k et un arbre binaire A calcule le nombre de noeuds de A au
;; niveau k. Ainsi

;; (ab-nb-feuilles-niveau 1 (ab-vide) )
;; et
;; (ab-nb-feuilles-niveau 3 (ab-vide) )
;; rendent 0. Et,
;; (ab-nb-feuilles-niveau 2 
;;                        (ab-noeud 1 
;;                           (ab-feuille 1) 
;;                           (ab-feuille 4) ) )
;; rend 2 et
;; (ab-nb-feuilles-niveau 1
;;                        (ab-noeud 1 
;;                           (ab-feuille 1) 
;;                           (ab-feuille 4) ) )
;; rend 0.

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

(define (ab-nb-feuilles ab)
  (if (ab-vide? ab)
      0
      (+ (if (ab-feuille? ab) 1 0)
         (ab-nb-feuilles (ab-gauche ab))
         (ab-nb-feuilles (ab-droit ab)))))

(verifier ab-nb-feuilles
          (ab-nb-feuilles (ab-vide)) => 0
          (ab-nb-feuilles (ab-noeud 2 
                                    (ab-vide) 
                                    (ab-noeud 3 
                                              (ab-feuille 3) 
                                              (ab-feuille 4) ) ) ) => 2
          )

(define (ab-nb-feuilles-niveau k ab)
  (define (rec n a)
    (cond ((ab-vide? ab) 0)
          ((= n k)
           (if (ab-feuille? a) 1 0))
          (else
           (+
            (rec (+ n 1) (ab-gauche a))
            (rec (+ n 1) (ab-droit a))))))
  (rec 1 ab))


(verifier ab-nb-feuilles-niveau
          (ab-nb-feuilles-niveau 1 (ab-noeud 1 (ab-feuille 1) (ab-vide))) => 0
          (ab-nb-feuilles-niveau 1 (ab-vide) ) => 0
          (ab-nb-feuilles-niveau 3 (ab-vide) ) => 0
          (ab-nb-feuilles-niveau 2 
                                 (ab-noeud 1 
                                           (ab-feuille 1) 
                                           (ab-feuille 4) ) ) => 2
          (ab-nb-feuilles-niveau 1
                                 (ab-noeud 1 
                                           (ab-feuille 1) 
                                           (ab-feuille 4) ) ) => 0
          )
