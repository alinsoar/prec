

;; Énoncé

;; [ab-meme-forme] Egalité et même forme d'un arbre binaire ou sous-arbre.

;; Écrire un prédicat nommé ab-egal? qui prend deux arbres binaires et
;; teste s'ils sont égaux. Ainsi

;; (ab-egal? (ab-noeud "a"
;;              (ab-noeud "b" 
;;                 (ab-vide) 
;;                 (ab-noeud "c"
;;                    (ab-vide) (ab-vide) ) )
;;              (ab-vide) )
;;           (ab-noeud "a"
;;              (ab-noeud "b" 
;;                 (ab-vide) 
;;                 (ab-noeud "c"
;;                    (ab-vide) (ab-vide) ) ) 
;;              (ab-vide) ) )
;; rend #t et
;; (ab-egal? (ab-noeud "a"
;;              (ab-vide)
;;              (ab-noeud "b" 
;;                 (ab-noeud "c"
;;                    (ab-vide) 
;;                    (ab-vide) )
;;                 (ab-vide) ) )
;;           (ab-vide) )
;; rend #f

;; Écrire un prédicat nommé ab-sous-arbre? qui prend deux arbres
;; binaires ab1 et ab2 et teste si ab1 est un sous arbre de ab2. Ainsi

;; (ab-sous-arbre? 
;;  (ab-noeud "a"
;;     (ab-noeud "b" 
;;        (ab-vide) 
;;        (ab-noeud "c"
;;           (ab-vide) 
;;           (ab-vide) ) )
;;     (ab-vide) )
;;  (ab-noeud "a"
;;     (ab-noeud "b" 
;;        (ab-vide) 
;;        (ab-noeud "c"
;;           (ab-vide) 
;;           (ab-vide) ) )
;;     (ab-vide) ) )
;; rend #t et
;; (ab-sous-arbre? 
;;  (ab-vide)
;;  (ab-noeud "a"
;;     (ab-vide)
;;     (ab-noeud "b" 
;;        (ab-noeud "c"
;;           (ab-vide) 
;;           (ab-vide) )
;;        (ab-vide) ) ) ) 
;; rend #t.
;; (ab-sous-arbre? 
;;  (ab-noeud "a" 
;;     (ab-vide) 
;;     (ab-vide) )
;;  (ab-noeud "a"
;;     (ab-vide)
;;     (ab-noeud "b" 
;;        (ab-noeud "c"
;;           (ab-vide) 
;;           (ab-vide) )
;;        (ab-vide) ) ) )
;; rend #f.

;; Écrire un prédicat nommé ab-meme-forme? qui prend deux arbres
;; binaires ab1 et ab2 et teste s'ils ont la même forme, c'est-à-dire
;; s'ils sont égaux du point de vue de leur structure, indépendamment
;; des étiquettes que les noeuds peuvent porter. Ainsi

;; (ab-meme-forme? 
;;  (ab-noeud "a"
;;     (ab-noeud "b" 
;;        (ab-vide) 
;;        (ab-noeud "c"
;;           (ab-vide) 
;;           (ab-vide) ) )
;;     (ab-vide) )
;;  (ab-noeud 1
;;     (ab-noeud 2   
;;        (ab-vide) 
;;        (ab-noeud 3
;;           (ab-vide) 
;;           (ab-vide) ) )
;;     (ab-vide) ) )
;; rend #t et
;; (ab-meme-forme? 
;;  (ab-noeud "a"
;;     (ab-vide)
;;     (ab-noeud "b" 
;;        (ab-noeud "c"
;;           (ab-vide) 
;;           (ab-vide) )
;;        (ab-vide) ) )
;;  (ab-vide) )
;; rend #f.

(load "arbre-binaire.rkt")

(define (ab-egal? a1 a2)
  (cond ((ab-vide? a1) (ab-vide? a2))
        ((ab-vide? a2) #f)
        (else (and
               (equal? (ab-etiquette a1) (ab-etiquette a2))
               (ab-egal? (ab-gauche a1) (ab-gauche a2))
               (ab-egal? (ab-droit a1) (ab-droit a2))))))

(verifier ab-egal?
          (ab-egal? (ab-vide) (ab-vide)) => #t
          (ab-egal? (ab-noeud "a" (ab-vide) (ab-vide))
                    (ab-vide)) => #f
          
          (ab-egal? (ab-noeud "a" (ab-vide) (ab-vide))
                    (ab-noeud "a"
                              (ab-noeud "a" (ab-vide) (ab-vide))
                              (ab-vide))) => #f
          )


(define (ab-sous-arbre? a b)
  (cond ((ab-egal? a b) #t)
        ((ab-vide? b) #f)
        (else (or (and
                   (ab-noeud? b)
                   (ab-sous-arbre? a (ab-gauche b)))
                  (and
                   (ab-noeud? b)
                   (ab-sous-arbre? a (ab-droit b)))))))


(verifier ab-sous-arbre?
          (ab-sous-arbre? 
           (ab-noeud "a"
                     (ab-noeud "b" 
                               (ab-vide) 
                               (ab-noeud "c"
                                         (ab-vide) 
                                         (ab-vide) ) )
                     (ab-vide) )
           (ab-noeud "a"
                     (ab-noeud "b" 
                               (ab-vide) 
                               (ab-noeud "c"
                                         (ab-vide) 
                                         (ab-vide) ) )
                     (ab-vide) ) ) => #t
          (ab-sous-arbre? (ab-vide) (ab-vide) ) => #t
          (ab-sous-arbre? (ab-noeud 2 (ab-vide) (ab-vide)) (ab-vide) ) => #f
          (ab-sous-arbre? 
           (ab-vide)
           (ab-noeud "a"
                     (ab-vide)
                     (ab-noeud "b" 
                               (ab-noeud "c"
                                         (ab-vide) 
                                         (ab-vide) )
                               (ab-vide) ) ) )  => #t
          (ab-sous-arbre? 
           (ab-noeud "a" 
                     (ab-vide) 
                     (ab-vide) )
           (ab-noeud "a"
                     (ab-vide)
                     (ab-noeud "b" 
                               (ab-noeud "c"
                                         (ab-vide) 
                                         (ab-vide) )
                               (ab-vide) ) ) ) => #f
          )



(define (ab-meme-forme? a1 a2)
  (cond ((ab-vide? a1) (ab-vide? a2))
        ((ab-vide? a2) #f)
        (else (and
               (ab-meme-forme? (ab-gauche a1) (ab-gauche a2))
               (ab-meme-forme? (ab-droit a1) (ab-droit a2))))))


(verifier ab-meme-forme?
          (ab-meme-forme? (ab-vide) (ab-vide)) => #t
          (ab-meme-forme? (ab-noeud "a" (ab-vide) (ab-vide))
                          (ab-vide)) => #f
          
          (ab-meme-forme? (ab-noeud "a" (ab-vide) (ab-vide))
                          (ab-noeud "a"
                                    (ab-noeud "a" (ab-vide) (ab-vide))
                                    (ab-vide))) => #f
                          
                          
          )
          
          

