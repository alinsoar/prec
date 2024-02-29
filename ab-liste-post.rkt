
;; Énoncé

;; [ab-liste-post] Liste des étiquettes en ordre postfixe d'un arbre
;; binaire

;; On rappelle que la liste des étiquettes en ordre postfixe d'un
;; arbre binaire A est la liste vide si A est vide. Sinon, c'est la
;; liste composée des étiquettes en ordre postfixe du sous-arbre
;; gauche de A, puis des étiquettes en ordre postfixe du sous-arbre
;; droit de A et enfin de l'étiquette de la racine de A.

;; Écrire la spécification et une définition Scheme de la fonction
;; ab-liste-post qui, étant donné un arbre binaire rend la liste de
;; ses étiquettes en ordre postfixe. Ainsi (ab-liste-post (ab-vide))
;; rend () et

;;  (ab-liste-post 
;;   (ab-noeud 1
;;      (ab-noeud 2
;;         (ab-noeud 4 (ab-vide) (ab-vide) )
;;         (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;      (ab-noeud 3
;;         (ab-noeud 6 (ab-vide) (ab-vide) ) 
;;         (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend (4 5 2 6 7 3 1)


(load "arbre-binaire.rkt")

(define (ab-liste-post arbre)
  (if (ab-vide? arbre)
      '()
      (append (ab-liste-post (ab-gauche arbre))
              (ab-liste-post (ab-droit arbre))
              (list (ab-etiquette arbre)))))

(verifier ab-liste-post
          (ab-liste-post (ab-vide) ) => ()
          (ab-liste-post
           (ab-noeud
            1
            (ab-noeud
             2
             (ab-noeud 4 (ab-vide) (ab-vide) )
             (ab-noeud 5 (ab-vide) (ab-vide) ) )
            (ab-noeud
             3
             (ab-noeud 6 (ab-vide) (ab-vide) ) 
             (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) ) => (4 5 2 6 7 3 1)
          )
