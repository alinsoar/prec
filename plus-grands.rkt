;; Énoncé

;; [plus-grands] Liste des termes plus grands qu'un nombre donné

;; Écrire une fonction nommée plus-grands qui prend un nombre x et une
;; liste de nombres L et qui rend la liste des nombres de L plus
;; grands ou égaux à x. Ainsi (plus-grands 3 (list 1 8 2 4 5 5 3))
;; rend (8 4 5 5 3). Vous devez utiliser la fonctionnelle filtrer pour
;; ce faire.


;;; ...
(define (plus-grands x L)
  (define (p? a) (>= a x))
  (filter p? L))

(verifier plus-grands
          (plus-grands 0 '(1 2 3) ) => (1 2 3)
          (plus-grands 9 '(1 1) ) => ()
          (plus-grands 4 '(0 3 5 7 2) ) => (5 7)
          )


(plus-grands 2 '(1 2 3 4))





