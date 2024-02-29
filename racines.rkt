
;; Énoncé

;; [racines] Racines d'une équation du second degré

;; Écrire une fonction nommée racines qui prend trois nombres a, b et
;; c et rend la liste des racines réelles différentes de l'équation du
;; second degré axx+bx+c=0. Par hypothèse a est supposé non nul. Ainsi
;; (racines 1 -2 1) rend (1).

;; On pourra regarder comment résoudre une équation du second
;; degré. Les tests impliquant des calculs sur des nombres flottants,
;; on utilisera aussi la comparaison approximative ~> plutôt que
;; l'égalité stricte que réalisent -> ou =>.

;; Écrire une fonction nommée solutions qui prend trois nombres a, b
;; et c et rend la liste de toutes les racines réelles de l'équation
;; axx+bx+c=0. Les paramètres a, b et c peuvent être nuls mais pas
;; tous ensemble. Ainsi (solutions 1 -2 1) rend (1 1) tandis que
;; (solutions 0 1 -5) rend (5). Écrire une fonction nommée
;; solutions-ordonnees qui prend trois nombres a, b et c et rend la
;; liste triée de toutes les racines réelles de l'équation
;; axx+bx+c=0. Les paramètres a, b et c peuvent être nuls mais pas
;; tous ensemble. Ainsi (solutions-ordonnees 1 -6 5) rend (1 5).

(define (abs a)
  (if (> a 0) a (- a)))

(verifier abs
	  (abs 0) => 0
	  (abs 1) => 1
	  (abs -1) => 1
	  )

(define (approx= a b)
  (< (abs (- a b)) .00001))

(verifier approx=
	  (approx= 0 0) => #t
	  (approx= 1 1.00000001) => #t
	  (approx= -1 -1.001 ) => #f
	  )

(define (~< a b)
  (< a (- b .00001)))

(verifier ~<
	  (~< 0 0) => #f
	  (~< 1 1.00000001) => #f
	  (~< 11 11.001) => #t
	  )

(define (racines a b c)
  (let ((s (solutions a b c)))
    (cond ((or (not (pair? s))
	       (not (pair? (cdr s))))
	   s)
	  ((approx= (car s) (cadr s))
	   (list (car s)))
	  (else s))))

(define (solutions a b c)
  (define (delta)
    (+ 0. (- (* b b) (* 4 a c))))
  
  (define (sdelta)
    (sqrt (delta)))
  
  (cond ((and (approx= a 0) (not (approx= b 0)))
	 (list (+ 0. (/ (- c) b))))
	((approx= a 0) '())
	(else
	 (cond ((~< (delta) 0) '())
	       ((approx= 0 (delta))
		(let ((s (+ 0. (/ (- b) (* 2 a)))))
		  (list s s)))
	       (else
		(list (/ (+ (- b) (sdelta)) (* 2 a))
		      (/ (- (- b) (sdelta)) (* 2 a))))))))

(define (solutions-ordonnees a b c)
  (define (length l)
    (if (pair? l) (+ 1 (length (cdr l))) 0))
  (let ((s (solutions a b c)))
    (cond ((< (length s) 2) s)
	  ((~< (car s) (cadr s)) s)
	  (else (cons (cadr s) (cons (car s) '()))))))

(verifier racines
	  (racines  0  0  6) => ()
	  (racines  0 -6  6) => (1.)
	  (racines  1  1  1)  => ()
          (racines  1 -6  5) => (5. 1.)
	  (racines -1  6 -5) => (1. 5.)
          (racines  1 -2  1) => (1.)
          (racines  1  0  1) => ()
	  )

(verifier solutions
	  (solutions  0  0  6) => ()
	  (solutions  0 -6  6) => (1.)
	  (solutions  1 -6  5) => (5. 1.)
	  (solutions -1  6 -5) => (1. 5.)
	  (solutions  1 -2  1) => (1. 1.)
	  (solutions  1  1  1) => ()
	  )

(verifier solutions-ordonnees
	  (solutions-ordonnees  0  0  6) => ()
	  (solutions-ordonnees  0 -6  6) => (1.)
	  (solutions-ordonnees  1 -6  5) => (1. 5.)
	  (solutions-ordonnees -1  6 -5) => (1. 5.)
	  (solutions-ordonnees  1 -2  1) => (1. 1.)
	  (solutions-ordonnees  1  1  1) => ()
	  )
