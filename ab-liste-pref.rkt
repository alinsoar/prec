
;; Énoncé

;; [ab-liste-pref] Liste des étiquettes en ordre préfixe d'un arbre
;; binaire

;; On rappelle que la liste des étiquettes en ordre préfixe d'un arbre
;; binaire A est la liste vide si A est vide. Sinon, c'est la liste
;; composée de l'étiquette de la racine de A, puis des étiquettes en
;; ordre préfixe du sous-arbre gauche de A, puis des étiquettes en
;; ordre préfixe du sous-arbre droit de A

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-liste-pref qui, étant donné un arbre binaire rend la liste de
;; ses étiquettes en ordre préfixe. Ainsi (ab-liste-pref (ab-vide))
;; rend () et

;;  (ab-liste-pref 
;;   (ab-noeud 1
;;      (ab-noeud 2
;;         (ab-noeud 4 (ab-vide) (ab-vide) )
;;         (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;      (ab-noeud 3
;;         (ab-noeud 6 (ab-vide) (ab-vide) ) 
;;         (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend (1 2 4 5 3 6 7)


(load "arbre-binaire.rkt")

(define (ab-liste-pref arbre)
  (if (ab-vide? arbre)
      '()
      (append (list (ab-etiquette arbre))
              (ab-liste-pref (ab-gauche arbre))
              (ab-liste-pref (ab-droit arbre)))))

(verifier ab-liste-pref
          (ab-liste-pref (ab-vide) ) => ()
          (ab-liste-pref
           (ab-noeud
            1
            (ab-noeud
             2
             (ab-noeud 4 (ab-vide) (ab-vide) )
             (ab-noeud 5 (ab-vide) (ab-vide) ) )
            (ab-noeud
             3
             (ab-noeud 6 (ab-vide) (ab-vide) ) 
             (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) ) => (1 2 4 5 3 6 7)
          )
