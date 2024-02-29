
;; Énoncé

;; [ag-nb-occ] Définition de fonction qui calcule le nombre
;; d'occurrences d'une etiquette dans un arbre général.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-nb-occ et foret-nb-occ mutuellement récursives telles que étant
;; donnés une étiquette e et un arbre général A (ag-nb-occ e A) rend
;; le nombre d'occurrences de l'étiquette e dans A. Ainsi

;; (ag-nb-occ "a" (ag-noeud "a" (list) ) )
;; rend 1,
;; (ag-nb-occ 2 (ag-noeud 2
;;                   (list  (ag-noeud 1 (list) ) 
;;                          (ag-noeud 2 (list) ) ) ) )

;; rend 2. Vos définitions ne devront pas utiliser de fonctionnelles

;; Écrire une définition Scheme de la fonction ag-nb-occ-bis de même
;; spécification que la fonction ag-nb-occ utilisant des
;; fonctionnelles.


;;;  ag-nb-occ:...
(define (ag-nb-occ e ab)
  (+
   (if (equal? e (ag-etiquette ab)) 1 0)
   (foret-nb-occ e (ag-foret ab))))

;;; foret-nb-occ:...
(define (foret-nb-occ e f)
  (define (rec x) (ag-nb-occ e x))
  (reduce + 0 (map rec f)))

(verifier ag-nb-occ
          (ag-nb-occ "a" (ag-noeud "a" (list) ) ) => 1
          (ag-nb-occ "x" (ag-noeud "a" (list) ) ) => 0
          (ag-nb-occ "a" (ag-noeud "a" (list (ag-noeud "a" (list) )) ) ) => 2
          )

;;;  ag-nb-occ-bis:...
(define (ag-nb-occ-bis e ab)
  (define (rec x) (ag-nb-occ-bis e x))
  (+
   (if (equal? e (ag-etiquette ab)) 1 0)
   (reduce + 0 (map rec (ag-foret ab)))))

(verifier ag-nb-occ-bis
          (ag-nb-occ-bis "a" (ag-noeud "a" (list) ) ) => 1
          (ag-nb-occ-bis "x" (ag-noeud "a" (list) ) ) => 0
          (ag-nb-occ-bis "a" (ag-noeud "a" (list (ag-noeud "a" (list) )) ) ) => 2
          )
