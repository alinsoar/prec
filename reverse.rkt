
;; Énoncé

;; [reverse] Renversement d'une liste

;; Écrire une fonction nommée reverse qui prend une liste et la
;; renverse c'est-à-dire construit une nouvelle liste dont le premier
;; terme est le dernier de la liste initiale, le second le pénultième
;; de la liste initiale etc. Ainsi (reverse '(a b c)) rend (c b a).

;; On pourra utilement utiliser la technique des accumulateurs où le
;; résultat en cours de construction est passé récursivement en
;; argument. Pour donner un exemple d'une telle technique, vous est
;; donnée la factorielle écrite avec un accumulateur.



(define (reduce f init L) (if (pair? L) (f (car L) (reduce f init (cdr L))) init))

(define (reverse L)
  (define (f x y) (append y (list x)))
  (reduce f '() L) )

(verifier reverse
          (reverse '(1 2 3)) => (3 2 1)
          (reverse '()) => ()
          )

;;;================EXEMPLE===================
;;; La factorielle en style avec accumulateur
(define (fact n)
  (define (! n resultat)
    (if (> n 0)
        (! (- n 1) (* n resultat))
        resultat ) )
  (! n 1) )

(verifier fact 
          (fact 0) => 1
          (fact 1) => 1
          (fact 2) => 2
          (fact 3) => 6
          )   

