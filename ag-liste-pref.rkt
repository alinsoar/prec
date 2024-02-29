;; Énoncé

;; [ag-liste-pref] Définition de fonction qui calcule la liste prefixe
;; des étiquettes d'un arbre général.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-liste-pref et foret-liste-pref mutuellement récursives telles
;; que étant donné un arbre général A (ag-liste-pref A) rend la liste
;; des étiquettes de A en ordre préfixe. Ainsi

;; (ag-liste-pref (ag-noeud "a" (list) ) )
;; rend ("a") et
;; (ag-liste-pref (ag-noeud 4
;;                   (list  (ag-noeud 1 (list (ag-noeud 5 (list) ) ) ) 
;;                          (ag-noeud 2 (list) ) 
;; 			 (ag-noeud 3 (list) ) ) ) )

;; rend (4 1 5 2 3). Vos définitions ne devront pas utiliser de
;; fonctionnelles

;; Écrire une définition Scheme de la fonction ag-liste-pref-bis de
;; même spécification que la fonction ag-liste-pref utilisant des
;; fonctionnelles.

(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

;;;  ag-liste-pref:...
(define (ag-liste-pref a)
  (append (list (ag-etiquette a))
          (foret-liste-pref (ag-foret a))))

;;; foret-liste-pref:...
(define (foret-liste-pref f)
  (reduce append '() (map ag-liste-pref f)))

(verifier ag-liste-pref
          (equal?
           (ag-liste-pref (ag-noeud "a" (list) ))
           '("a")
           ) => #t
          (equal?
           (ag-liste-pref (ag-noeud "a"
                                    (list (ag-noeud "b"
                                                    (list) )) ))
           '("a" "b")
           ) => #t
          )

;;;  ag-liste-pref-bis:...
(define (ag-liste-pref-bis a)
  (append (list (ag-etiquette a))
          (reduce append '() (map ag-liste-pref-bis (ag-foret a)))))

(verifier ag-liste-pref-bis
          (equal?
           (ag-liste-pref-bis (ag-noeud "a" (list) ))
           '("a")
           ) => #t
          (equal?
           (ag-liste-pref-bis (ag-noeud "a"
                                        (list (ag-noeud "b"
                                                        (list) )) ))
           '("a" "b")
           ) => #t
          
          )

(ag-liste-pref-bis (ag-noeud "a" (list) ) )
