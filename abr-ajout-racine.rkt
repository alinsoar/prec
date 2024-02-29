

;; Énoncé

;; [abr-ajout-racine] Ajout d'une étiquette à la racine d'un arbre
;; binaire de recherche numérique

;; Le but de cet exercice est d'ajouter une étiquette x à la racine
;; d'un arbre binaire de recherche ABR suivant la méthode décrite
;; ci-dessous. Le travail à réaliser n'est pas trivial car il faut
;; garantir que l'arbre obtenu soit bien un arbre binaire de
;; recherche, ce qui est moins simple à faire que lors d'un ajout de x
;; en tant que feuille.

;; Nous allons voir dans cet exercice comment procéder. Pour cela,
;; nous allons décomposer le travail en deux étapes. Dans un premier
;; temps, nous allons « séparer » les étiquettes de ABR qui sont plus
;; petites que x des étiquettes qui sont plus grandes que x. C'est le
;; rôle de la première fonction abr-coupure. Ensuite, la fonction
;; abr-ajout-racine construira le résultat final attendu.

;; Donner la spécification et une définition de la fonction
;; abr-coupure qui, étant donnés un nombre x et un arbre binaire de
;; recherche numérique ABR, rend le couple d'arbres binaires de
;; recherche numériques tel que : 1) le premier arbre du couple est
;; composé des étiquettes de ABR strictement inférieures à x, 2) le
;; second arbre du couple est composé des étiquettes de ABR
;; strictement supérieures à x. Ce couple constitue la coupure de
;; l'arbre binaire de recherche numérique ABR selon le nombre x. Par
;; exemple:

;; (abr-coupure 12 (ab-noeud 12
;;                    (ab-noeud 5 
;;                       (ab-vide) 
;;                       (ab-noeud 8 (ab-vide) (ab-vide)))
;;                    (ab-noeud 15 
;;                       (ab-vide) 
;;                       (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
;; rend la liste valeur de
;; (list (ab-noeud 5 
;;          (ab-vide) 
;;          (ab-noeud 8 (ab-vide) (ab-vide) ) )
;;       (ab-noeud 15 
;;          (ab-vide) 
;;          (ab-noeud 20 (ab-vide) (ab-vide) ) ) )
;; et
;; (abr-coupure 7 (ab-noeud 12
;;                   (ab-noeud 5 
;;                      (ab-vide) 
;;                      (ab-noeud 8 (ab-vide) (ab-vide) ) )        
;;                   (ab-noeud 15 
;;                      (ab-vide) 
;;                      (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
;; rend la liste valeur de
;; (list (ab-noeud 5 
;;          (ab-vide) 
;;          (ab-vide))
;;       (ab-noeud 12
;;          (ab-noeud 8 (ab-vide) (ab-vide) )
;;          (ab-noeud 15 
;;             (ab-vide) 
;;             (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )

;; Donner la spécification et une définition de la fonction
;; abr-ajout-racine qui étant donnés un nombre x et un arbre binaire
;; de recherche numérique ABR rend l'arbre binaire de recherche ABR
;; dans lequel x a été ajouté à la racine. Par exemple:

;; (abr-ajout-racine 7            
;;                   (ab-noeud 12
;;                      (ab-noeud 5 
;;                         (ab-vide) 
;;                         (ab-noeud 8 (ab-vide) (ab-vide) ) )
;;                      (ab-noeud 15 
;;                         (ab-vide) 
;;                         (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
;; rend
;;  (ab-noeud 7
;;     (ab-noeud 5 (ab-vide) (ab-vide) )
;;     (ab-noeud 12
;;        (ab-noeud 8 (ab-vide) (ab-vide) ) 
;;        (ab-noeud 15 
;;           (ab-vide) 
;;           (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) ) )


(load "arbre-binaire.rkt")

(define (abr-coupure x A)
  (define (rec<x ab)
    (cond
     ((and (ab-noeud? ab)
           (< (ab-etiquette ab) x))
      (ab-noeud (ab-etiquette ab)
                (rec<x (ab-gauche ab))
                (rec<x (ab-droit ab))))
     ((and (ab-noeud? ab)
           (>= (ab-etiquette ab) x))
      (let ((arbre-gauche (rec<x (ab-gauche ab))))
        (if (ab-vide? arbre-gauche)
            (ab-vide)
            (ab-noeud (ab-etiquette arbre-gauche)
                      (ab-gauche arbre-gauche)
                      (ab-droit arbre-gauche)))))
     (else (ab-vide))))
  
  (define (rec>x ab)
    (cond ((and (ab-noeud? ab)
                (> (ab-etiquette ab) x))
           (ab-noeud (ab-etiquette ab)
                     (rec>x (ab-gauche ab))
                     (rec>x (ab-droit ab))))
          ((and (ab-noeud? ab)
                (<= (ab-etiquette ab) x))
           (let ((arbre-droit (rec>x (ab-droit ab))))
             (if (ab-vide? arbre-droit)
                 (ab-vide)
                 (ab-noeud (ab-etiquette arbre-droit)
                           (ab-gauche arbre-droit)
                           (ab-droit arbre-droit)))))
          (else (ab-vide))))
  (list  (rec<x A) (rec>x A)))


(verifier abr-coupure
          (equal?
           (abr-coupure 12 (ab-noeud 12
                                     (ab-noeud 5 
                                               (ab-vide) 
                                               (ab-noeud 8 (ab-vide) (ab-vide)))
                                     (ab-noeud 15 
                                               (ab-vide) 
                                               (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
           (list (ab-noeud 5 
                           (ab-vide) 
                           (ab-noeud 8 (ab-vide) (ab-vide) ) )
                 (ab-noeud 15 
                           (ab-vide) 
                           (ab-noeud 20 (ab-vide) (ab-vide) ) ) )
           ) => #t
          (equal?
           (abr-coupure 7 (ab-noeud 12
                                    (ab-noeud 5 
                                              (ab-vide) 
                                              (ab-noeud 8 (ab-vide) (ab-vide) ) )        
                                    (ab-noeud 15 
                                              (ab-vide) 
                                              (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
           (list (ab-noeud 5 
                           (ab-vide) 
                           (ab-vide))
                 (ab-noeud 12
                           (ab-noeud 8 (ab-vide) (ab-vide) )
                           (ab-noeud 15 
                                     (ab-vide) 
                                     (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
           ) => #t
          )

(define (abr-ajout-racine x A)
  (let* ((a (abr-coupure x A)))
    (ab-noeud x
              (car a)
              (cadr a))))

(verifier abr-ajout-racine
          (equal?
           (abr-ajout-racine 7 (ab-vide))
           (ab-noeud 7 (ab-vide) (ab-vide)))
          (equal?
           (abr-ajout-racine 7            
                             (ab-noeud 12
                                       (ab-noeud 5 
                                                 (ab-vide) 
                                                 (ab-noeud 8 (ab-vide) (ab-vide) ) )
                                       (ab-noeud 15 
                                                 (ab-vide) 
                                                 (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
           (ab-noeud 7
                     (ab-noeud 5 (ab-vide) (ab-vide) )
                     (ab-noeud 12
                               (ab-noeud 8 (ab-vide) (ab-vide) ) 
                               (ab-noeud 15 
                                         (ab-vide) 
                                         (ab-noeud 20 (ab-vide) (ab-vide) ) ) ) )
           ) => #t
             )


