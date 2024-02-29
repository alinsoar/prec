
;; Énoncé

;; [ag-replace] Définition de fonction qui renvoie un arbre dans
;; lequel toutes les occurrences d'une etiquette donnée ont été
;; remplacées par une autre.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-replace et foret-replace mutuellement récursives telles que
;; étant donnés deux étiquettes e et f, ainsi qu'un arbre général A
;; (ag-replace e f A) rend l'arbre A dans lequel toutes les
;; occurrences de l'etiquette e ont été remplacées par l'étiquette
;; f. Ainsi

;; (ag-replace "a" "b" (ag-noeud "a" (list) ) )
;; rend
;; (ag-noeud "b" (list) )
;; (ag-replace 2 8 (ag-noeud 2
;;                   (list  (ag-noeud 1 (list) ) 
;;                          (ag-noeud 2 (list) ) ) ) )
;; rend
;; (ag-noeud 8
;;           (list  (ag-noeud 1 (list) )
;;                  (ag-noeud 8 (list) ) ) )
;; et
;; (ag-replace 18 11 (ag-noeud 2
;;                   (list  (ag-noeud 1 (list) ) 
;;                          (ag-noeud 2 (list) ) ) ) )
;; rend
;; (ag-noeud 2
;;           (list  (ag-noeud 1 (list) )
;;                  (ag-noeud 2 (list) ) ) )

;; Vos définitions ne devront pas utiliser de fonctionnelles

;; Écrire une définition Scheme de la fonction ag-replace-bis de même
;; spécification que la fonction ag-nb-occ utilisant des
;; fonctionnelles.

(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

;;;  ag-replace:...
(define (ag-replace x y ab)
  (ag-noeud (if (equal? x (ag-etiquette ab))
                y
                (ag-etiquette ab))
            (foret-replace x y (ag-foret ab))))

;;; foret-replace:...
(define (foret-replace x y f)
  (define (rec w) (ag-replace x y w) )
  (map rec f) )

(verifier ag-replace
          (equal?
           (ag-replace 2 3 (ag-noeud 2 (list (ag-noeud 2 (list)))))
           (ag-noeud 3 (list (ag-noeud 3 (list))))
           ) => #t
          (equal?
           (ag-replace 1 3 (ag-noeud 2 (list (ag-noeud 2 (list)))))
           (ag-noeud 2 (list (ag-noeud 2 (list))))
           ) => #t
             )

;;;  ag-replace-bis-bis:...
(define (ag-replace-bis x y ab)
  (define (rec w) (ag-replace-bis x y w) )
  (ag-noeud (if (equal? x (ag-etiquette ab))
                y
                (ag-etiquette ab))
            (map rec (ag-foret ab))))

(verifier ag-replace-bis
          (equal?
           (ag-replace-bis 2 3 (ag-noeud 2 (list (ag-noeud 2 (list)))))
           (ag-noeud 3 (list (ag-noeud 3 (list))))
           ) => #t
          (equal?
           (ag-replace-bis 1 3 (ag-noeud 2 (list (ag-noeud 2 (list)))))
           (ag-noeud 2 (list (ag-noeud 2 (list))))
           ) => #t
          )

(ag-replace "a" "b" (ag-noeud "a" (list) ) )

