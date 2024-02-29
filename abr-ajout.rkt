

;; Énoncé

;; [abr-ajout] Ajout d'une étiquette, aux feuilles, dans un arbre
;; binaire de recherche numérique

;; Le but de cet exercice est d'ajouter des étiquettes (c'est-à-dire
;; des nombres) dans un arbre binaire de recherche numérique. On
;; rappelle que les étiquettes d'un arbre binaire de recherche sont
;; toujours deux à deux distinctes. Ici, pour ajouter un nombre x dans
;; un arbre binaire de recherche numérique, on le placera en tant
;; qu'étiquette d'une nouvelle feuille : l'ajout de x se fait là où la
;; recherche se terminerait par un échec. Si l'arbre est vide, l'ajout
;; de x rend la feuille d'etiquette x. Donner la spécification et une
;; définition de la fonction abr-ajout qui, étant donnés un nombre x
;; et un arbre binaire de recherche numérique ABR renvoie un arbre
;; binaire de recherche dans lequel x a été ajouté s'il n'apparaissait
;; pas dans ABR. Ainsi

;; (abr-ajout 2 (ab-noeud 12
;;                 (ab-noeud 5 
;;                    (ab-vide) 
;;                    (ab-noeud 8 (ab-vide) (ab-vide)))
;;                 (ab-noeud 15 
;;                    (ab-vide) 
;;                    (ab-noeud 20 (ab-vide) (ab-vide)) ) ))
;; rend
;; (ab-noeud 12
;;           (ab-noeud 5 
;;              (ab-noeud 2 (ab-vide) (ab-vide))
;;              (ab-noeud 8 (ab-vide) (ab-vide)) )
;;           (ab-noeud 15 
;;              (ab-vide) 
;;              (ab-noeud 20 (ab-vide) (ab-vide)) ) )
;; et
;; (abr-ajout 15 (ab-noeud 12
;;                  (ab-noeud 5 
;;                     (ab-vide) 
;;                     (ab-noeud 8 (ab-vide) (ab-vide)) )       
;;                  (ab-noeud 15 
;;                     (ab-vide) 
;;                     (ab-noeud 20 (ab-vide) (ab-vide)) ) ))
;; rend
;; (ab-noeud 12
;;    (ab-noeud 5 
;;       (ab-vide) 
;;       (ab-noeud 8 (ab-vide) (ab-vide)) )
;;    (ab-noeud 15 
;;       (ab-vide) 
;;       (ab-noeud 20 (ab-vide) (ab-vide)) ) )

;; Donner la spécification et une définition de la fonction liste->abr
;; qui étant donnée une liste de nombres rend un arbre binaire de
;; recherche dont les étiquettes sont les nombres apparaissant dans la
;; liste. Par exemple: (liste->abr (list)) rend l'arbre vide et

;; (liste->abr '(15 4 8 12))
;; rend (par exemple)
;; (ab-noeud 12
;;    (ab-noeud 8 
;;       (ab-noeud 4 (ab-vide) (ab-vide))
;;       (ab-vide))
;;    (ab-noeud 15 (ab-vide)(ab-vide)) )


(load "arbre-binaire.rkt")

;;; abr-ajout: ...
;;; (abr-ajout x ABR) ...
(define (abr-ajout x ab)
  (cond ((ab-vide? ab) (ab-noeud x (ab-vide) (ab-vide)))
        ((> (ab-etiquette ab) x) (ab-noeud (ab-etiquette ab)
                                           (abr-ajout x (ab-gauche ab))
                                           (ab-droit ab)))
        ((< (ab-etiquette ab) x) (ab-noeud (ab-etiquette ab)
                                           (ab-gauche ab)
                                           (abr-ajout x (ab-droit ab))))
        (else ab)))

(verifier abr-ajout
          (equal?
           (abr-ajout 10 (ab-vide))
           (ab-noeud 10 (ab-vide) (ab-vide))
           ) => #t

          (equal?
           (abr-ajout 15 (ab-noeud 10 (ab-vide) (ab-vide)))
           (ab-noeud 10 (ab-vide) (ab-noeud 15 (ab-vide) (ab-vide)))
           ) => #t

          (equal?
           (abr-ajout 10 (ab-noeud 15 (ab-vide) (ab-vide)))
           (ab-noeud 15 (ab-noeud 10 (ab-vide) (ab-vide)) (ab-vide))
           ) => #t
          
          (equal?
           (abr-ajout 10 (ab-noeud 10 (ab-vide) (ab-vide)))
           (ab-noeud 10 (ab-vide) (ab-vide))
           ) => #t
         )

(define (liste->abr L)
  (define (rec l a)
    (if (pair? l)
        (abr-ajout (car l) (rec (cdr l) a))
        a))
  (rec L (ab-vide)))

(verifier liste->abr
          (equal?
           (liste->abr '())
           (ab-vide)
           ) => #t
         (equal? (liste->abr '(1) )
                 (ab-noeud 1 (ab-vide) (ab-vide))
           ) => #t
          )
