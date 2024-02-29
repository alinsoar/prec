
;; Énoncé

;; [ag-nb-feuilles-niveau] Calcul du nombre de feuilles d'un certain
;; niveau dans un arbre général.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-nb-feuilles-niveau et foret-nb-feuilles-niveau mutuellement
;; récursives telles que, étant donné un naturel strictement positif k
;; et un arbre général A, (ag-nb-feuilles-niveau k A) rend le nombre
;; de feuilles de niveau k dans A. On rappelle que la racine d'un
;; arbre est au niveau 1 et qu'il n'y a pas de noeuds au niveau 0 dans
;; un arbre. Ainsi

;; (ag-nb-feuilles-niveau 1 (ag-noeud "a" (list) ) )
;; rend 1,

;; (ag-nb-feuilles-niveau 2 (ag-noeud "a" (list) ) )
;; rend 0,

;; (ag-nb-feuilles-niveau 2 
;;  (ag-noeud 1
;;     (list (ag-noeud 2 (list))
;;           (ag-noeud 3 (list))
;;           (ag-noeud 4 (list (ag-noeud 1 (list)))) ) ) )

;; rend 2 et

;; (ag-nb-feuilles-niveau 1 
;;  (ag-noeud 1
;;     (list (ag-noeud 2 (list))
;;           (ag-noeud 3 (list))
;;           (ag-noeud 4 (list (ag-noeud 1 (list)))) ) ) )

;; rend 0. Vos définitions ne devront pas utiliser de fonctionnelles

;; Écrire une définition Scheme de la fonction
;; ag-nb-feuilles-niveau-bis de même spécification que la fonction
;; ag-nb-feuilles utilisant des fonctionnelles.


(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

;;;  ag-nb-feuilles-niveau: ...
(define (ag-nb-feuilles-niveau n ab)
  (+ (if (and (= n 1)
              (not (pair? (ag-foret ab))))
	 1
	 0)
     (foret-nb-feuilles-niveau n (ag-foret ab))
     )
  )

;;; foret-nb-feuilles-niveau:...
(define (foret-nb-feuilles-niveau k f)
  (define (rec a) (ag-nb-feuilles-niveau (- k 1) a))
  (reduce + 0 (map rec f)))

(verifier ag-nb-feuilles-niveau
	  (ag-nb-feuilles-niveau 1 (ag-noeud 3 (list))) => 1
	  (ag-nb-feuilles-niveau 2 (ag-noeud 3 (list))) => 0
	  (ag-nb-feuilles-niveau 1 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
	  (ag-nb-feuilles-niveau 3 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
          )

;;;  ag-nb-feuilles-niveau-bis:...
(define (ag-nb-feuilles-niveau-bis n ab)
  (define (rec a) (ag-nb-feuilles-niveau-bis (- n 1) a))
  (+ (if (and (= n 1)
              (not (pair? (ag-foret ab))))
	 1
	 0)
     (reduce + 0 (map rec (ag-foret ab)))))


(verifier ag-nb-feuilles-niveau-bis
	  (ag-nb-feuilles-niveau-bis 1 (ag-noeud 3 (list))) => 1
	  (ag-nb-feuilles-niveau-bis 2 (ag-noeud 3 (list))) => 0
	  (ag-nb-feuilles-niveau-bis 1 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
	  (ag-nb-feuilles-niveau-bis 3 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
	  )


