
;; Énoncé

;; [abr-string] Manipulation d'un arbre binaire de chaînes de caractères

;; Écrire un semi-prédicat nommé abrs-recherche qui prend une chaîne
;; de caractères s et un arbre binaire de recherche avec des chaînes
;; de caractères comme étiquettes et qui ramène le sous-arbre de
;; racine s s'il existe.

(load "arbre-binaire.rkt")

(define (abrs-recherche x ab)
  (cond ((ab-vide? ab) #f)
        ((string>? x (ab-etiquette ab))
         (abrs-recherche x (ab-droit ab)))
        ((string>? (ab-etiquette ab) x)
         (abrs-recherche x (ab-gauche ab)))
        (else ab)))

(verifier abrs-recherche
          (abrs-recherche "10" (ab-vide) ) => #f
          (abrs-recherche "10" (ab-noeud "0" (ab-vide) (ab-vide)) ) => #f
          (abrs-recherche "0" (ab-noeud "10" (ab-vide) (ab-vide)) ) => #f
          (equal? (abrs-recherche "10" (ab-noeud "10" (ab-vide) (ab-vide)) )
                  (ab-noeud "10" (ab-vide) (ab-vide))) => #t
          )

