
;; Énoncé

;; [moins-occurrences] Supprimer toutes les occurrences d'un élément d'une liste.

;; Écrire une fonction nommée moins-occurrences qui prend un terme et
;; une liste et qui rend cette même liste privée de ce terme. Ainsi
;; (moins-occurrences 3 (list 1 3 4 3 5 5 3)) rend (1 4 5 5) et
;; (moins-occurrences "ma" (list "me" "ma" "mi")) rend ("me"
;; "mi"). Vous devez utiliser la fonctionnelle filtrer pour ce faire.




;;; ...
(define (moins-occurrences terme liste)
  (define (p? a) (not (equal? a terme)))
  (filter p? liste)
  )

(verifier moins-occurrences
          (moins-occurrences 1 '(1 1 1) ) => ()
          (moins-occurrences 2 '(0 0 1) ) => (0 0 1)
          (moins-occurrences 3 (list 1 3 4 3 5 5 3)) => (1 4 5 5) 
          )





