
;; Énoncé

;; [ab-liste-inf] Liste des étiquettes en ordre infixe d'un arbre
;; binaire

;; On rappelle que la liste des étiquettes en ordre infixe d'un arbre
;; binaire A est la liste vide si A est vide. Sinon, c'est la liste
;; composée des étiquettes en ordre infixe du sous-arbre gauche de A,
;; de l'étiquette de la racine de A suivie des étiquettes en ordre
;; infixe du sous-arbre droit de A

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-liste-inf qui, étant donné un arbre binaire rend la liste de ses
;; étiquettes en ordre infixe. Ainsi (ab-liste-inf (ab-vide)) rend ()
;; et

;;  (ab-liste-inf (ab-noeud 1
;;                   (ab-noeud 2
;;                      (ab-noeud 4 (ab-vide) (ab-vide) )
;;                      (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;                   (ab-noeud 3
;;                      (ab-noeud 6 (ab-vide) (ab-vide) ) 
;;                      (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend (4 2 5 1 6 3 7)

(load "arbre-binaire.rkt")

(define (ab-liste-inf arbre)
  (if (ab-vide? arbre)
      '()
      (append (ab-liste-inf (ab-gauche arbre))
              (list (ab-etiquette arbre))
              (ab-liste-inf (ab-droit arbre)))))

(verifier ab-liste-inf
          (ab-liste-inf (ab-vide) ) => ()
          (ab-liste-inf
           (ab-noeud
            1
            (ab-noeud
             2
             (ab-noeud 4 (ab-vide) (ab-vide) )
             (ab-noeud 5 (ab-vide) (ab-vide) ) )
            (ab-noeud
             3
             (ab-noeud 6 (ab-vide) (ab-vide) ) 
             (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) ) => (4 2 5 1 6 3 7)
          )
