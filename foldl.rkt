

;; Énoncé

;; [foldl] Une réduction dans l'autre sens

;; La fonctionnelle reduce combine un opérateur binaire, une valeur de
;; fin et une liste de termes comme suit:

;;    (reduce f fin (list e1 e2 ... eN))
;; == (f e1 (f e2  ... (f eN fin) ... ))
;; On souhaite symétriser l'opérateur binaire et obtenir que:
;;    (foldl f fin (list e1 e2 ... eN))
;; == (f (f ... (f fin eN) ... e2) e1)

;; Écrire donc une telle fonctionnelle qui est utile lorsque
;; l'opérateur binaire n'est pas commutatif (comme par exemple -, / ou
;; cons). Ainsi (foldl list (list) (list "a" "bb" "ccc")) rend (((()
;; "ccc") "bb") "a") tandis que (foldl - 100 (list 9 8 7 6)) rend 70


(define (reduce f init L) (if (null? L) init (f (reduce f init (cdr L)) (car L))))

;;; (foldl f fin (list e1 e2 ... eN)) calcule 
;;; (f (f ... (f fin eN) ... e2) e1)
(define (foldl f fin L) (reduce f fin L))

(verifier foldl
          (foldl list (list) (list "a" "bb" "ccc")) => (((() "ccc") "bb") "a")
          (foldl - 100 (list 9 8 7 6)) => 70
          )
