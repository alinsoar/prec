
;; Énoncé

;; [ag-egal] Définition de fonction qui teste l'égalité de deux arbres
;; généraux.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-egal? et foret-egal? mutuellement récursives telles que, étant
;; donnés deux arbres généraux A1 et A2, (ag-egal? A1 A2) rend vrai si
;; et seulement si les deux arbres sont égaux, faux sinon. Ainsi

;; (ag-egal? (ag-noeud "a" (list) ) (ag-noeud "a" (list) ) )
;; rend #t,
;; (ag-egal?  (ag-noeud 2
;;                   (list  (ag-noeud 1 (list) ) 
;;                          (ag-noeud 2 (list) ) ) ) 
;; 	    (ag-noeud 2
;;                   (list  (ag-noeud 11 (list) ) 
;;                          (ag-noeud 12 (list) ) ) ) )
;; rend #f et
;; (ag-egal?  (ag-noeud 2
;;                   (list  (ag-noeud 1 (list) ) 
;;                          (ag-noeud 2 (list) ) ) ) 
;; 	    (ag-noeud 2
;;                   (list  (ag-noeud 1 (list) ) ) ) )
;; rend #f aussi.


;;;  ag-egal?:...
(define (ag-egal? a1 a2)
  (and (equal? (ag-etiquette a1)
               (ag-etiquette a2))
       (foret-egal? (ag-foret a1)
                    (ag-foret a2))))

;;; foret-egal?:...
(define (foret-egal? f1 f2)
  (define (longueur l) (if (pair? l) (+ 1 (longueur (cdr l))) 0))
  (define (zip w1 w2)
    (if (null? w1)
        '()
        (cons (ag-egal? (car w1) (car w2))
              (zip (cdr w1) (cdr w2)))))
  (define (o x y) (and x y))
  (define (all l) (reduce o #t l))
  (and (= (longueur f1) (longueur f2))
       (all (zip f1 f2))))

(verifier ag-egal?
          (ag-egal? (ag-noeud 2
                              (list (ag-noeud 2 (list) ) ) ) 
                    (ag-noeud 2
                              (list (ag-noeud 1 (list) ) 
                                    (ag-noeud 2 (list) ) ) ) ) => #f
          (ag-egal? (ag-noeud 2
                              (list (ag-noeud 1 (list) ) 
                                    (ag-noeud 2 (list) ) ) ) 
                    (ag-noeud 2
                              (list (ag-noeud 1 (list) ) 
                                    (ag-noeud 2 (list) ) ) ) ) => #t
          (ag-egal? (ag-noeud 2
                              (list (ag-noeud 1 (list) ) 
                                    (ag-noeud 2 (list) ) ) ) 
                    (ag-noeud 2
                              (list (ag-noeud 11 (list) ) 
                                    (ag-noeud 12 (list) ) ) ) ) => #f
          (ag-egal? (ag-noeud 2
                              (list (ag-noeud 1 (list) ) 
                                    (ag-noeud 2 (list) ) ) ) 
                    (ag-noeud 2
                              (list (ag-noeud 1 (list) ) 
                                    (ag-noeud 12 (list) ) ) ) ) => #f
          )

