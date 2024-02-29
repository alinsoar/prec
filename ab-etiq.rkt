

;; Énoncé

;; [ab-etiq] Présence, nombre d'occurrences et remplacement d'une
;; étiquette dans arbre binaire

;; Écrire la spécification et une définition du prédicat ab-etiq-dans?
;; qui étant donnés une étiquette e et un arbre binaire A teste si
;; cette étiquette apparait dans A. Par exemple :

;;  (ab-etiq-dans? 3 (ab-vide))
;; rend #f alors que
 
;; (ab-etiq-dans? "b" (ab-noeud "a" 
;;                        (ab-noeud "b" (ab-vide) (ab-vide) ) 
;;                        (ab-vide) ) )
;; rend #t.

;; Écrire la spécification et une définition de la fonction ab-nb-occ
;; qui, étant donnés une étiquette e et un arbre binaire A rend le
;; nombre d'occurence de e dans A. Ainsi,

;;  (ab-nb-occ "a" (ab-vide)) 
;; rend 0 et
;;  (ab-nb-occ 2 (ab-noeud 1
;;                  (ab-noeud 2
;;                     (ab-noeud 4 (ab-vide) (ab-vide) )
;;                     (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;                  (ab-noeud 3
;;                     (ab-noeud 2 (ab-vide) (ab-vide) ) 
;;                     (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend 2

;; Écrire la spécification et une définition de la fonction
;; ab-remplace-etiq qui, étant donné deux étiquettes e1 et e2 un arbre
;; binaire A rend l'arbre A dans lequel les occurrences de e1 ont été
;; remplacées par e2. Par exemple :

;;  (ab-remplace-etiq 
;;   2 66 (ab-noeud 1
;;           (ab-noeud 2
;;              (ab-noeud 4 (ab-vide) (ab-vide) )
;;              (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;           (ab-noeud 3
;;              (ab-noeud 2 (ab-vide) (ab-vide) ) 
;;              (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )
;; rend
;; (ab-noeud 1
;;    (ab-noeud 66
;;       (ab-noeud 4 (ab-vide) (ab-vide) )
;;       (ab-noeud 5 (ab-vide) (ab-vide) ) )
;;    (ab-noeud 3
;;       (ab-noeud 66 (ab-vide) (ab-vide) ) 
;;       (ab-noeud 7 (ab-vide) (ab-vide) ) ) )

;;; ab-nb-occ: object * ab[object] => booleen
(define (ab-etiq-dans? e ab)
  (cond ((ab-vide? ab) #f)
        ((equal? e (ab-etiquette ab)) #t)
        (else (or (ab-etiq-dans? e (ab-gauche ab))
                  (ab-etiq-dans? e (ab-droit ab))))))

(verifier ab-etiq-dans?
          (ab-etiq-dans? 3 (ab-vide))  => #f
          (ab-etiq-dans? "b" (ab-noeud "a" 
                                       (ab-noeud "b" (ab-vide) (ab-vide) ) 
                                       (ab-vide) ) ) => #t
          (ab-etiq-dans? "b" (ab-noeud "a" 
                                       (ab-vide) 
                                       (ab-noeud "b" (ab-vide) (ab-vide) ) ) ) => #t
          (ab-etiq-dans? "x" (ab-noeud "a" 
                                       (ab-noeud "b" (ab-vide) (ab-vide) ) 
                                       (ab-vide) ) ) => #f
          )

;;; ab-nb-occ: object * ab[object] => entier
(define (ab-nb-occ e ab)
  (cond ((ab-vide? ab) 0)
        ((equal? e (ab-etiquette ab))
         (+ 1
            (ab-nb-occ e (ab-gauche ab))
            (ab-nb-occ e (ab-droit ab))))
        (else (+ (ab-nb-occ e (ab-gauche ab))
                 (ab-nb-occ e (ab-droit ab))))))

(verifier ab-nb-occ
          (ab-nb-occ 3 (ab-vide))  => 0
          (ab-nb-occ "b" (ab-noeud "a" 
                                   (ab-noeud "b" (ab-vide) (ab-vide) ) 
                                   (ab-vide) ) ) => 1
          (ab-nb-occ "x" (ab-noeud "a" 
                                   (ab-noeud "b" (ab-vide) (ab-vide) ) 
                                   (ab-vide) ) ) => 0
          (ab-nb-occ "a" (ab-vide)) => 0
          (ab-nb-occ 2 (ab-noeud 1
                                 (ab-noeud 2
                                           (ab-noeud 4 (ab-vide) (ab-vide) )
                                           (ab-noeud 5 (ab-vide) (ab-vide) ) )
                                 (ab-noeud 3
                                           (ab-noeud 2 (ab-vide) (ab-vide) ) 
                                           (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) ) => 2
                                           )

;;; ab-remplace-etiq: object * object * ab[object] => ab[object]
(define (ab-remplace-etiq x y ab)
  (if (ab-vide? ab)
      (ab-vide)
      (ab-noeud
       (if (equal? x (ab-etiquette ab))
           y
           (ab-etiquette ab) )
       (ab-remplace-etiq x y (ab-gauche ab))
       (ab-remplace-etiq x y (ab-droit ab)))))

(verifier ab-remplace-etiq
          (equal?
           (ab-remplace-etiq 
            2 66 (ab-noeud
                  1
                  (ab-noeud
                   2
                   (ab-noeud 4 (ab-vide) (ab-vide) )
                   (ab-noeud 5 (ab-vide) (ab-vide) ) )
                  (ab-noeud
                   3
                   (ab-noeud 2 (ab-vide) (ab-vide) ) 
                   (ab-noeud 7 (ab-vide) (ab-vide) ) ) ) )

           (ab-noeud 1
                     (ab-noeud 66
                               (ab-noeud 4 (ab-vide) (ab-vide) )
                               (ab-noeud 5 (ab-vide) (ab-vide) ) )
                     (ab-noeud 3
                               (ab-noeud 66 (ab-vide) (ab-vide) ) 
                               (ab-noeud 7 (ab-vide) (ab-vide) ) ) )

           
           )

          (equal?
           (ab-remplace-etiq 
            3 66 (ab-noeud
                  1
                  (ab-noeud 4 (ab-vide) (ab-vide) )
                  (ab-noeud 5 (ab-vide) (ab-vide) ) )
            )
           (ab-noeud
            1
            (ab-noeud 4 (ab-vide) (ab-vide) )
            (ab-noeud 5 (ab-vide) (ab-vide) ) )) => t

          (equal?
           (ab-remplace-etiq 
            3 66 (ab-vide)
            )
           (ab-vide)) => t
           
           )
          )
