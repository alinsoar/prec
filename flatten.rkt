
;; Énoncé

;; [flatten] Aplatissement d'une S-expression

;; Écrire une fonction nommée flatten qui prend une expression et
;; retourne la liste de tous les symboles qui y apparaissent. Ainsi
;; (flatten '(a (b) (((c) a)))) rend (a b c a) et (flatten 'z) rend
;; (z).

;; C'est un exercice classique où la difficulté est de faire le moins
;; possible d'appel à cons.



(define (flatten L)
  (cond ((equal? L '()) L)
        ((symbol? L)
         (list L))
        ((pair? (car L))
         (append (flatten (car L))
                 (flatten (cdr L))))
        (else (cons (car L)
                    (flatten (cdr L))))))

(verifier flatten
          (flatten '((a))) => (a)
          (flatten '()) => ()
          (flatten '(a (b) (((c) a)))) => (a b c a) 
          (flatten 'z) => (z)
          )


