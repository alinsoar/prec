
;; Énoncé

;; [ag-liste-feuilles] Définition de fonction qui calcule la liste des
;; étiquettes des feuilles d'un arbre général.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-liste-feuilles et foret-liste-feuilles mutuellement récursives
;; telles que étant donné un arbre général A (ag-liste-feuilles A)
;; rend la liste des étiquettes des feuilles de A. Ainsi

;; (ag-liste-feuilles (ag-noeud "a" (list) ) )
;; rend ("a") et
;; (ag-liste-feuilles (ag-noeud 4
;;                   (list  (ag-noeud 1 (list) ) 
;;                          (ag-noeud 2 (list) ) 
;; 			 (ag-noeud 3 (list) ) ) ) )

;; rend (1 2 3). Vos définitions ne devront pas utiliser de
;; fonctionnelles

;; Écrire une définition Scheme de la fonction ag-liste-feuilles-bis
;; de même spécification que la fonction ag-liste-feuilles utilisant
;; des fonctionnelles.

(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

(define (ag-liste-feuilles-bis ab)
  (if (pair? (ag-foret ab))
      (reduce append '() (map ag-liste-feuilles-bis (ag-foret ab)))
      (cons
       (ag-etiquette ab)
       (reduce append
               '()
               (map ag-liste-feuilles-bis (ag-foret ab))))))

(verifier ag-liste-feuilles-bis
          (equal?
           (ag-liste-feuilles-bis (ag-noeud "a" (list) ))
           '("a")
           ) => #t
          (equal?
           (ag-liste-feuilles-bis (ag-noeud "a"
                                            (list (ag-noeud "a"
                                                            (list) )) ))
           '("a")
           ) => #t
          )

(define (foret-liste-feuilles f)
  (reduce append '() (map ag-liste-feuilles f)))


(define (ag-liste-feuilles ab)
  (if (pair? (ag-foret ab))
      (foret-liste-feuilles (ag-foret ab))
   (cons
    (ag-etiquette ab)
    (reduce append
            '()
            (map ag-liste-feuilles (ag-foret ab))))))

(verifier ag-liste-feuilles
          (equal?
           (ag-liste-feuilles (ag-noeud "a" (list) ))
           '("a")
           ) => #t
          (equal?
           (ag-liste-feuilles (ag-noeud "a"
                                        (list (ag-noeud "a"
                                                        (list) )) ))
           '("a")
           ) => #t
          )
