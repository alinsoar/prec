
;; Énoncé

;; [ag-max] Définition de fonction qui calcule l'étiquette maximale
;; d'un arbre général de nombres.

;; Écrire la spécification et une définition Scheme des fonctions
;; ag-max et foret-max mutuellement récursives telles que, étant donné
;; un arbre général de nombres A, (ag-max A) rend la plus grande
;; étiquette apparaissant dans A. Ainsi

;; (ag-max (ag-noeud 2 (list) ) )
;; rend 2 et
;; (ag-max (ag-noeud 2.3
;;                   (list  (ag-noeud 11.8 (list) ) 
;;                          (ag-noeud -2.1 (list) ) ) ) )

;; rend 11.8 Vos définitions ne devront pas utiliser de fonctionnelles

;; Écrire une définition Scheme de la fonction ag-max-bis de même
;; spécification que la fonction ag-max utilisant des fonctionnelles.

(load "arbre-general.rkt")

(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))

;;;  ag-max: ArbreGeneral[Nombre] -> Nombre 
;;; (ag-max A) rend la plus grande étiquette de A
(define (ag-max A)
  (if (pair? (ag-foret A))
      (max (ag-etiquette A)
           (foret-max (ag-foret A)))
      (ag-etiquette A)))

;;; foret-max : Foret[Nombre] -> Nombre
;;; (foret-max F) rend la plus étiquette aparaissant dans F
;;; HYPOTHESE : F est non vide
(define (foret-max f)
  (define (maximum x y) (max x y))
  (reduce
   maximum
   (ag-max (car f))
   (map ag-max (cdr f))))

(verifier ag-max
          (ag-max (ag-noeud 2 '())) => 2
          (ag-max (ag-noeud 2 (list (ag-noeud 3 '())))) => 3
          )

;;;  ag-max-bis: ArbreGeneral[Nombre] -> Nombre
(define (ag-max-bis A)
  (define (maximum x y) (max x y))
  (reduce
   maximum
   (ag-etiquette A)
   (map ag-max (ag-foret A))))

(verifier ag-max-bis
          (ag-max-bis (ag-noeud 2 '())) => 2
          (ag-max-bis (ag-noeud 2 (list (ag-noeud 3 '())))) => 3
          )
