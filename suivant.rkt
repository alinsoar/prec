
;; Énoncé

;; [suivant] Suites géométriques

;; Écrire une fonction nommée suivant qui prend deux nombres u_n et r
;; et qui rend le terme suivant u_n dans la suite géométrique de
;; raison r. Dans cette suite, u_n+1 = u_n * r. Ainsi (suivant 1 4)
;; rend 4 et (suivant 5 2) rend 10.

;; Écrire une fonction nommée liste0aN qui prend deux nombres u_0, r
;; et un entier naturel n et qui rend la liste (u_0 u_1 ... u_n) où
;; les u_n forment la suite géométrique de départ u_0 et de raison
;; r. Ainsi (liste0aN 1 2 5) rend (1 2 4 8 16 32) et (liste0aN 3 1 4)
;; rend (3 3 3 3 3).

;; Écrire une fonction nommée listeNa0 qui prend deux nombres u_0, r
;; et un entier naturel n et qui rend la liste (u_n ... u_1 u_0) où
;; les u_n forment la suite géométrique de départ u_0 et de raison
;; r. Ainsi (listeNa0 1 5 2) rend (25 5 1) et (listeNa0 1 0 2) rend (0
;; 0 1).

;; Écrire une fonction nommée liste-fibo qui prend un entier naturel n
;; et qui rend la liste (fib_n ... fib_1 fib_0) où les fib_n forment
;; la suite de Fibonacci définie comme fib_0 = fib_1 = 1 et fib_n+2 =
;; fib_n + fib_n+1. (liste-fibo 6) rend (13 8 5 3 2 1 1).



;;; 
(define (suivant u_n r)
  (* u_n r))

(verifier suivant
          (suivant 1 4) => 4
          (suivant 5 2) => 10
          )

(define (liste0aN u_0 r n)
  (if (= n 0)
      (list u_0)
      (append (list u_0)
              (liste0aN (* u_0 r) r (- n 1)))))

(verifier liste0aN
          (liste0aN 3 1 4) => (3 3 3 3 3)
          (liste0aN 1 2 5) => (1 2 4 8 16 32) 
          )

(define (listeNa0 u_0 r n)
  (if (= n 0)
      (list u_0)
      (append (listeNa0 (* u_0 r) r (- n 1))
              (list u_0))))

(verifier listeNa0
          (listeNa0 3 1 4) => (3 3 3 3 3)
          (listeNa0 1 2 5) => (32 16 8 4 2 1)
          )

(define (liste-fibo n)
  (define (rec v k)
    (cond ((> k n) v)
          (else (rec (cons (+ (car v)
                              (cadr v))
                           v)
                     (+ k 1)))))
  (cond ((= n 0) '(1))
        ((= n 1) '(1 1))
        (else (rec '(1 1) 2))))

(verifier liste-fibo
          (liste-fibo 1) => (1 1)
          (liste-fibo 0) => (1)
          (liste-fibo 6) => (13 8 5 3 2 1 1)
          )


