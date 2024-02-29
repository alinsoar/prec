

;; Énoncé

;; [ab-liste-feuilles] Listes des étiquettes des feuilles d'un arbre binaire

;; Un arbre est une feuille s'il ne possède qu'un seul noeud. Écrire
;; la spécification et une définition du prédicat ab-feuille? qui
;; étant donné un arbre binaire teste si cet arbre est une
;; feuille. Par exemple : (ab-feuille? (ab-vide)) rend #f alors que

 
;; (ab-feuille? (ab-noeud 1 
;;                        (ab-vide) 
;;                        (ab-vide) ) )
;; rend #t.

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-liste-feuilles-GD qui, étant donné un arbre binaire rend sa
;; frondaison c'est-à-dire la liste des étiquettes de ses feuilles de
;; gauche à droite. Ainsi (ab-liste-feuilles-GD (ab-vide)) rend () et

;;  (ab-liste-feuilles-GD 
;;   (ab-noeud 1
;;      (ab-noeud 2
;;         (ab-noeud 4 (ab-vide) (ab-vide) )
;;         (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;      (ab-noeud 3
;;         (ab-noeud 6 (ab-vide) (ab-vide) ) 
;;         (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend (4 5 6 7)

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-liste-feuilles-DG qui, étant donné un arbre binaire rend la
;; liste des étiquettes de ses feuilles de droite à gauche. Ainsi
;; (ab-liste-feuilles-DG (ab-vide)) rend () et

;;  (ab-liste-feuilles-DG 
;;   (ab-noeud 1
;;      (ab-noeud 2
;;         (ab-noeud 4 (ab-vide) (ab-vide) )
;;         (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;      (ab-noeud 3
;;         (ab-noeud 6 (ab-vide) (ab-vide) ) 
;;         (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend (7 6 5 4)

(load "arbre-binaire.rkt")


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

(define (ab-liste-feuilles-GD ab)
  (cond ((ab-vide? ab) '())
        ((ab-feuille? ab)
         (append (ab-liste-feuilles-GD (ab-gauche ab))
                 (cons (ab-etiquette ab)
                       (ab-liste-feuilles-GD (ab-droit ab)))))
        (else (append (ab-liste-feuilles-GD (ab-gauche ab))
                      (ab-liste-feuilles-GD (ab-droit ab))))))

(verifier ab-liste-feuilles-GD
          (ab-liste-feuilles-GD (ab-vide)) => ()
          (ab-liste-feuilles-GD 
           (ab-noeud 1
                     (ab-noeud 2
                               (ab-noeud 4 (ab-vide) (ab-vide) )
                               (ab-noeud 5 (ab-vide) (ab-vide) ) )
                     (ab-noeud 3
                               (ab-noeud 6 (ab-vide) (ab-vide) ) 
                               (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) ) => (4 5 6 7)
          )


(define (ab-liste-feuilles-DG ab)
  (cond ((ab-vide? ab) '())
        ((ab-feuille? ab)
         (append (ab-liste-feuilles-DG (ab-droit ab))
                 (list (ab-etiquette ab))
                 (ab-liste-feuilles-DG (ab-gauche ab))))
        (else (append (ab-liste-feuilles-DG (ab-droit ab))
                      (ab-liste-feuilles-DG (ab-gauche ab))))))

(verifier ab-liste-feuilles-DG
          (ab-liste-feuilles-DG (ab-vide)) => ()
          (ab-liste-feuilles-DG 
           (ab-noeud 1
                     (ab-noeud 2
                               (ab-noeud 4 (ab-vide) (ab-vide) )
                               (ab-noeud 5 (ab-vide) (ab-vide) ) )
                     (ab-noeud 3
                               (ab-noeud 6 (ab-vide) (ab-vide) ) 
                               (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) ) => (7 6 5 4)
          )

