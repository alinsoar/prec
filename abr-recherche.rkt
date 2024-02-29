
;; Énoncé

;; [abr-recherche] Recherche dans un arbre binaire de recherche
;; numérique

;; Le but de cet exercice est de rechercher des étiquettes
;; (c'est-à-dire des nombres) dans un arbre binaire de recherche
;; numérique. On supposera par la suite que les étiquettes d'un arbre
;; binaire de recherche sont toujours deux à deux distinctes. Donner
;; la spécification et une définition du semi-prédicat abr-recherche
;; qui, étant donnés un nombre x et un arbre binaire de recherche
;; numérique ABR renvoie #f si x n'apparaît pas dans ABR, ou sinon
;; renvoie le sous-arbre de ABR de racine x. Ainsi
;; (abr-recherche 2 (ab-noeud 12
;;                     (ab-noeud 5 
;;                        (ab-vide) 
;;                        (ab-noeud 8 (ab-vide) (ab-vide)))
;;                     (ab-noeud 15 
;;                        (ab-vide) 
;;                        (ab-noeud 20
;;                           (ab-vide) (ab-vide) ) ) ) )
;; rend #f et
;; (abr-recherche 15 (ab-noeud 12
;;                      (ab-noeud 5 
;;                         (ab-vide) 
;;                         (ab-noeud 8 (ab-vide) (ab-vide)) )
;;                      (ab-noeud 15 
;;                         (ab-vide) 
;;                         (ab-noeud 20 (ab-vide) (ab-vide)) ) ) )
;; rend
;; (ab-noeud 15 (ab-vide) 
;;              (ab-noeud 20
;;                        (ab-vide) 
;;                        (ab-vide) ) )


(load "arbre-binaire.rkt")

(define (abr-recherche x ab)
  (cond ((ab-vide? ab) #f)
        ((> x (ab-etiquette ab))
         (abr-recherche x (ab-droit ab)))
        ((< x (ab-etiquette ab))
         (abr-recherche x (ab-gauche ab)))
        (else ab)))

(verifier abr-recherche
          (abr-recherche 10 (ab-vide) ) => #f
          (abr-recherche 10 (ab-noeud 0 (ab-vide) (ab-vide)) ) => #f
          (abr-recherche 0 (ab-noeud 10 (ab-vide) (ab-vide)) ) => #f
          (equal? (abr-recherche 10 (ab-noeud 10 (ab-vide) (ab-vide)) )
                  (ab-noeud 10 (ab-vide) (ab-vide))) => #t
          )

