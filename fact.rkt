
;; Énoncé

;; [fact] Curieux calcul de la factorielle

;; Écrire une fonction nommée iota qui prend un entier naturel non nul
;; et qui rend la liste des entiers naturels de 1 à cet entier. Ainsi
;; (iota 4) rend (1 2 3 4). Cette fonction est ainsi nommée en hommage
;; au langage APL.

;; Écrire ensuite une fonction nommée fact utilisant iota et reduce et
;; calculant la factorielle de son argument. Cette programmation est
;; amusante mais coûteuse car elle fabrique une liste pour son calcul.



;;; iota: nat -> LISTE[nat]
;;; (iota n) rend la liste (1 2 ... n)
;;; HYPOTHÈSE: n > 0
(define (iota n)
  (define (f x y) (append y (list x)))
  (define (L k) (if (= k 1) '(1) (append (L (- k 1)) (list k))))
  (L n))

(iota 5)

(verifier iota
          (iota 4) => (1 2 3 4)
          (iota 1) => (1)
          )



;;; En Mrscheme il y a reduce

;;; fact: nat -> nat
;;; (fact n) rend n!
;;; HYPOTHÈSE: n > 0
(define (fact n)
  (define (f x y) (* x y))
  (reduce f 1 (iota n)) )


(verifier fact
          (fact 1) => 1
          (fact 2) => 2
          (fact 3) => 6
          )



