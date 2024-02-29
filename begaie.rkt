
;; Énoncé

;; [begaie] Bégayer une liste

;; Écrire une fonction nommée begaie qui prend une liste de termes et
;; rend la liste où chacun de ces termes est redoublé. Ainsi (begaie
;; (list 1 2 3)) rend (1 1 2 2 3 3).

;; Écrire une fonction nommée debegaie qui prend une liste de termes
;; et rend la liste où plus aucun terme n'est redoublé. Ainsi
;; (debegaie (begaie (list 1 2 3))) rend (1 2 3) tandis que (debegaie
;; (list 1 1 1 2 2 2 1)) rend (1 2 1).

;; Écrire une fonction nommée debegaie-verif qui prend une liste de
;; termes et vérifie que la liste a bien été produite par la fonction
;; begaie et dans ce cas se comporte comme debegaie. La fonction
;; debegaie-verif signale une erreur si ce n'est pas le cas. Ainsi
;; (debegaie-verif (begaie (list 1 2 3))) rend (1 2 3) tandis que
;; (debegaie-verif (list 1 1 1 2 2)) signale une erreur.


(define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))


(define (begaie L)
  (define (dup x) (list x x))
  (reduce append '() (map dup L)) )

(verifier begaie
          (begaie '()) => ()
          (begaie '(1)) => '(1 1)
          (begaie '(1 2 3 1)) => (1 1 2 2 3 3 1 1 )
          )

(define (debegaie L)
  (cond ((null? L)
         '())
        ((null? (cdr L))
         L)
        ((equal? (car L) (cadr L))
         (cons (car L)
               (debegaie (cddr L))))
        (else (debegaie (cdr L))))) 

(verifier debegaie
          (debegaie '(1 1 2) ) => (1 2)
          (debegaie (begaie (list 1 2 3))) => (1 2 3)
          (debegaie '()) => ()
          )

(define (debegaie-verif L)
  (cond ((null? L)
         '())
        ((null? (cdr L))
         #f)
        ((equal? (car L) (cadr L))
         (let ((x (debegaie-verif (cddr L))))
           (and x
                (cons (car L)
                      x
                      ))))
        (else #f)))


(verifier debegaie-verif
          (debegaie-verif '(1 1)) => (1)
          (debegaie-verif '()) => ()
          (debegaie-verif '(1)) => #f
          (debegaie-verif '(1 1 2)) => #f
          )

(debegaie-verif (list))












