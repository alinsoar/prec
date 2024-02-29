

(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

;;;  ag-nb-noeuds-niveau: ...
(define (ag-nb-noeuds-niveau n ab)
  (+ (if (and (= n 1)
              (not (pair? (ag-foret ab))))
	 1
	 0)
     (foret-nb-noeuds-niveau n (ag-foret ab))
     )
  )

;;; foret-nb-noeuds-niveau:...
(define (foret-nb-noeuds-niveau k f)
  (define (rec a) (ag-nb-noeuds-niveau (- k 1) a))
  (reduce + 0 (map rec f)))

(verifier ag-nb-noeuds-niveau
	  (ag-nb-noeuds-niveau 1 (ag-noeud 3 (list))) => 1
	  (ag-nb-noeuds-niveau 2 (ag-noeud 3 (list))) => 0
	  (ag-nb-noeuds-niveau 1 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
	  (ag-nb-noeuds-niveau 3 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
          )

;;;  ag-nb-noeuds-niveau-bis:...
(define (ag-nb-noeuds-niveau-bis n ab)
  (define (rec a) (ag-nb-noeuds-niveau-bis (- n 1) a))
  (+ (if (= n 1)
	 1
	 0)
     (reduce + 0 (map rec (ag-foret ab)))))


(verifier ag-nb-noeuds-niveau-bis
	  (ag-nb-noeuds-niveau-bis 1 (ag-noeud 3 (list))) => 1
	  (ag-nb-noeuds-niveau-bis 2 (ag-noeud 3 (list))) => 0
	  (ag-nb-noeuds-niveau-bis 1 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
	  (ag-nb-noeuds-niveau-bis 3 (ag-noeud 3 (list (ag-noeud 3 (list))))) => 0
	  )


