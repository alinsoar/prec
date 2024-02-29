
;; Énoncé

;; [nieme] N-ième terme d'une liste

;; Écrire une fonction nommée n-ieme qui prend un entier naturel et
;; une liste et rend le n-ième terme de cette liste. On numérote les
;; termes à partir de 0 et l'on signalera une erreur s'il n'y a pas un
;; tel terme. Ainsi (n-ieme 0 (list "ah" "beh" "c")) rend "ah" et
;; (n-ieme 2 (list 11 22 33 44)) rend 33.


;;; ...
(define (n-ieme n L)
  (cond ((and (pair? L) (= n 0))
         (car L))
        ((not (pair? L))
         (error 'err "err"))
        (else (n-ieme (- n 1) (cdr L)))))

(verifier n-ieme
          (n-ieme 0 '(0) ) => 0
          (n-ieme 0 '()) => ERREUR
          (n-ieme 1 '(0 1) ) => 1
          (n-ieme 3 '(0 1)) => ERREUR
          )









