;; Énoncé
;; [booleens] Définition de fonctions booléennes

;; Sans utiliser les formes spéciales and et or, ni la fonction not,
;; écrire les trois fonctions booléennes ou, et et non.

;; En utilisant les fonctions précédentes, écrire les fonctions
;; booléennes implique, ou-exclusif et equivalent dont les
;; spécifications sont données.





;;; ou : bool * bool -> bool
;;; (ou x y) rend vrai si x ou y est vrai.
(define (ou x y)
  (if x #t (if y #t #f)))

(verifier ou
	  (ou #t #t) => #t
	  (ou #t #f) => #t
	  (ou #f #t) => #t
	  (ou #f #f) => #f
)

;;; et : bool * bool -> bool
;;; (et x y) rend vrai si x et y sont vrais.
(define (et x y)
  (if x y #f))

(verifier et
	  (et #t #t) => #t
	  (et #t #f) => #f
	  (et #f #t) => #f
	  (et #f #f) => #f
)


;;; non : Booleen -> Booleen
;;; ...
(define (non x)
  (if x #f #t))

(verifier non
	  (non #t) => #f
	  (non #f) => #t
	  )

;;; implique : bool * bool -> bool
;;; (implique a b) rend vrai lorsque "a implique b" est vrai c'est-a-dire
;;; si a est faux ou si b est vrai.
(define (implique a b)
  (ou b (non a)))

(verifier implique
	  (implique #t #t) => #t
	  (implique #t #f) => #f
	  (implique #f #t) => #t
	  (implique #f #f) => #t
	  )

;;; ou-exclusif : bool * bool -> bool
;;; (ou-exclusif a b) est vrai ssi une et une seule des valeurs a et b 
;;; est vraie.
(define (ou-exclusif a b)
  (ou (et (non a) b)
      (et (non b) a)))

(verifier ou-exclusif
	  (ou-exclusif #t #t) => #f
	  (ou-exclusif #f #f) => #f
	  (ou-exclusif #t #f) => #t
	  (ou-exclusif #f #t) => #t
	  )

;;; equivalent: bool * bool -> bool
;;; (equivalent a b) est vrai si et seulement si a et b ont même valeur.
(define (equivalent a b)
  (non (ou-exclusif a b)))

(verifier equivalent
	  (equivalent #t #t ) => #t
	  (equivalent #f #f ) => #t
	  (equivalent #t #f ) => #f
	  (equivalent #f #t ) => #f
)
