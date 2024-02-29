;; [divise] Prédicats et semi-prédicats autour de la divisibilité d'un
;; entier.

;; En n'utilisant pas les prédicats prédéfinis even? et odd?, écrire
;; la spécification et une définition Scheme du prédicat nombre-pair?
;; qui, étant donné un nombre entier, rend vrai si, et seulement si,
;; ce nombre est pair. Par exemple : (nombre-pair? -10) est vrai alors
;; que (nombre-pair? 3) est faux.

;; Écrire la spécification et une définition Scheme de la fonction
;; divise? qui, étant donnés un entier strictement positif m et un
;; entier n rend vrai si, et seulement si, m divise n. Par exemple :
;; (divise? 3 12) et (divise? 2 8) sont vrais, ce que n'est pas
;; (divise? 6 35).

;; Écrire une définition de la fonction nombre-pair2?, de même
;; spécification que la fonction nombre-pair? et qui utilise la
;; fonction divise?.

;; Un semi-prédicat est une fonction qui renvoie soit #f, soit une
;; valeur vraie quelconque mais différente de #f. Écrire la
;; spécification et une définition Scheme du semi-prédicat
;; quotient-si-divise qui, étant donnés un entier strictement positif
;; m et un entier n rend le quotient de n par m si m divise n et le
;; booléen faux sinon.

;; Écrire la spécification et une définition Scheme du semi-prédicat
;; produit-diviseur-quotient-si qui, étant donnés un entier
;; strictement positif m et un entier n rend le produit de m et du
;; quotient de n par m si m divise n et le booléen faux sinon. Par
;; exemple (produit-diviseur-quotient-si 3 12) rend 12 mais
;; (produit-diviseur-quotient-si 6 35) rend #f.


;;; nombre-pair?: Nombre -> Booleen
;;; ...
(define (nombre-pair? x)
  (= 0 (remainder x 2)))

(verifier nombre-pair?
	  (nombre-pair? 1) => #f
	  (nombre-pair? 0) => #t
	  )

;;; divise? : Nombre * Nombre -> Booleen
;;; ...
(define (divise? x y)
  (= 0 (remainder y x)))

(verifier divise?
	  (divise? 3 12 ) => #t
	  (divise? 3 13 ) => #f
	  )

;;; nombre-pair2? : Nombre -> Booleen
(define (nombre-pair2? x)
  (divise? 2 x))

(verifier nombre-pair2?
	  (nombre-pair2? 1) => #f
	  (nombre-pair2? 0) => #t
	  )

;;; quotient-si-divise : Nombre * Nombre -> Booleen
;;; (quotient-si-divise m n) ... 
(define (quotient-si-divise m n)
  (if (divise? m n) (quotient n m) #f))

(verifier quotient-si-divise 
	  (quotient-si-divise 3 12) => 4
	  (quotient-si-divise 6 35) => #f
	  )

;;; produit-diviseur-quotient-si: Nombre * Nombre -> Nombre/Booleen
;;; (produit-diviseur-quotient-si m n) ...
;;; HYPOTHESE: m > 0
(define (produit-diviseur-quotient-si m n)
  (if (divise? m n) (* m (quotient n m)) #f))

(verifier produit-diviseur-quotient-si
	  (produit-diviseur-quotient-si 3 12) => 12
	  (produit-diviseur-quotient-si 3 13) => #f
	  (produit-diviseur-quotient-si 6 35) => #f
	  )
