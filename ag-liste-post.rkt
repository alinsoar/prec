
;; Énoncé

;; [ag-liste-post] Liste postfixe des étiquettes d'un arbre général.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-liste-post et foret-liste-post mutuellement récursives telles
;; que étant donné un arbre général A (ag-liste-post A) rend la liste
;; des étiquettes de A en ordre postfixe. Ainsi

;; (ag-liste-post (ag-noeud "a" (list) ) )
;; rend ("a") et
;; (ag-liste-post (ag-noeud 4
;;                   (list  (ag-noeud 1 (list (ag-noeud 5 (list) ) ) ) 
;;                          (ag-noeud 2 (list) ) 
;; 			 (ag-noeud 3 (list) ) ) ) )

;; rend (5 1 2 3 4). Vos définitions ne devront pas utiliser de
;; fonctionnelles

;; Écrire une définition Scheme de la fonction ag-liste-post-bis de
;; même spécification que la fonction ag-liste-post utilisant des
;; fonctionnelles.

(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

;;;  ag-liste-post:...
(define (ag-liste-post a)
  (append (foret-liste-post (ag-foret a))
          (list (ag-etiquette a))))

;;; foret-liste-post:...
(define (foret-liste-post f)
  (reduce append '() (map ag-liste-post f)))

(verifier ag-liste-post
          (equal?
           (ag-liste-post (ag-noeud "a" (list) ))
           '("a")
           ) => #t
          (equal?
           (ag-liste-post (ag-noeud "a"
                                    (list (ag-noeud "a"
                                                    (list) )) ))
           '("a" "a")
           ) => #t
          )

;;;  ag-liste-post-bis:...
(define (ag-liste-post-bis a)
  (append (reduce append '() (map ag-liste-post-bis (ag-foret a)))
          (list (ag-etiquette a))))

(verifier ag-liste-post-bis
          (equal?
           (ag-liste-post-bis (ag-noeud "a" (list) ))
           '("a")
           ) => #t
          (equal?
           (ag-liste-post-bis (ag-noeud "a"
                                        (list (ag-noeud "a"
                                                        (list) )) ))
           '("a" "a")
           ) => #t
          
          )

(ag-liste-post-bis (ag-noeud "a" (list) ) )
