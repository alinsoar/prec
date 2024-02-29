;; Énoncé

;; [quicksort] Tri de listes

;; Écrire une fonction nommée merge qui prend deux listes de nombres
;; triées en ordre croissant et rend une liste contenant tous ces
;; éléments en ordre croissant. Ainsi (merge (list 1 3 4) (list 2 4
;; 5)) rend (1 2 3 4 4 5).

;; Écrire une fonction nommée divide qui prend un nombre (le pivot) et
;; une liste de nombres et qui partage la liste en deux listes, la
;; première contient tous les éléments inférieurs au pivot tandis que
;; la seconde contient tous les éléments supérieurs ou égaux au
;; pivot. Ainsi, (divide 5 (list 1 5 2 9))rend ((1 2)(5 9)).

;; Écrire une fonction nommée quicksort qui prend une liste de nombres
;; et qui rend une liste triée contenant ces nombres. Ainsi (quicksort
;; (list 1 4 2 9 7 3 5)) rend (1 2 3 4 5 7 9).

;; Nota: ce n'est pas stricto-sensu l'algorithme dit du quick-sort car
;; l'opération consistant à couper en deux paquets la liste initiale
;; ne peut être faite en temps constant en Scheme.

;; Écrire une fonction nommée sort qui prend un comparateur et une
;; liste de choses comparables avec ce comparateur et qui rend une
;; liste triée contenant ces choses. Ainsi (sort < (list 1 4 2 9 7 3
;; 5)) rend (1 2 3 4 5 7 9) tandis que (sort > (list 1 4 2 9 7 3 5))
;; rend (9 7 5 4 3 2 1).


(require racket/trace)

;;; merge: LISTE[Nombre] * LISTE[Nombre] -> LISTE[Nombre]
;;; (merge L1 L2)  rend la liste triée contenant exactement les éléments
;;; des listes triées L1 et L2.
(define (merge L1 L2)
  (cond ((not (pair? L1)) L2)
	((not (pair? L2)) L1)
	((< (car L1) (car L2))
	 (cons (car L1) (merge (cdr L1) L2)))
	(else
	 (cons (car L2) (merge L1 (cdr L2))))))

(verifier merge
	  (merge (list 1 3 4) (list 2 4 5)) => (1 2 3 4 4 5)
	  (merge '() '(1)) => (1)
	  (merge '(1) '()) => (1)
	  (merge '(1) '(2)) => (1 2)
	  (merge '(2) '(1)) => (1 2)
	  )

;;; divide: Nombre * LISTE[Nombre] -> COUPLE[LISTE[Nombre], LISTE[Nombre]]
;;; (divide pivot L) partage la liste L en deux listes, la première contient
;;; tous les éléments inférieurs au pivot tandis que la seconde contient
;;; tous les éléments supérieurs ou égaux au pivot.
(define (divide pivot L)
  ;; (define (left l)
  ;;   (cond ((not (pair? l)) '())
  ;; 	  ((< (car l) pivot)
  ;; 	   (cons (car l) (left (cdr l))))
  ;; 	  (else (left (cdr l)))))
  ;; (define (right l)
  ;;   (cond ((not (pair? l)) '())
  ;; 	  ((>= (car l) pivot)
  ;; 	   (cons (car l) (right (cdr l))))
  ;; 	  (else (right (cdr l)))))
  (define (reverse l)
    (if (pair? l)
	(append (reverse (cdr l)) (list (car l)))
	'()))
  (define (rec left right l)
    (cond ((not (pair? l))
	   (list (reverse left) (reverse right)))
	  ((< (car l) pivot)
	   (rec (cons (car l) left)
		right
		(cdr l)))
	  (else (rec left
		     (cons (car l) right)
		     (cdr l)))))
  
  ;; (list (left L) (right L))
  (rec '() '() L)
  )

(verifier divide
	  (divide 5 (list 1 5 2 9) ) => ((1 2) (5 9)) 
	  (divide 1 '(0 2)) => ((0) (2))
	  (divide 1 '(2 3)) => (() (2 3)) 
	  )

;;; quicksort: LISTE[Nombre] -> LISTE[Nombre]
;;; (quicksort L) rend la liste triée des éléments de L.
(define (quicksort L)
  ;; (define (make-random l)
  ;;   (if (pair? l)
  ;; 	(cons (random 2) (make-random (cdr l)))
  ;; 	'()))
  ;; (define (count-random l)
  ;;   (cond ((not (pair? l)) 0)
  ;; 	  ((= 1 (car l))
  ;; 	   (+ 1 (count-random (cdr l))))
  ;; 	  (else (count-random (cdr l)))))
  ;; (define (filter-random l)
  ;;   (cond ((not (pair? l))
  ;; 	   '())
  ;; 	  ((= 0 (car l))
  ;; 	   (cons 0 (filter-random (cdr l))))
  ;; 	  (else (cons (random 2)
  ;; 		      (filter-random (cdr l))))))
  ;; (define (get-pivot)
  ;;   (define (rec l r)
  ;;     (if (= 1 (car r))
  ;; 	  (car l)
  ;; 	  (rec (cdr l) (cdr r))))
  ;;   (rec L (make-pivot (make-random L))))
  ;; (define (make-pivot l)
  ;;   (cond ((= 1 (count-random l))
  ;; 	   l)
  ;; 	  ((= 0 (count-random l))
  ;; 	   (make-pivot (make-random l)))
  ;; 	  (else (make-pivot (filter-random l)))))
  ; the SECOND type of pivot
  (define (longueur l)
    (if (pair? l)
  	(+ 1 (longueur (cdr l)))
  	0))
  (define (get-nth n r)
    (if (= n 0)
  	(car r)
  	(get-nth (- n 1) (cdr r))))
  (define (get-pivot2)
    (get-nth (random (longueur L)) L))
  ;; yet ANOTHER pivot
  ;; (define (get-pivot3)
  ;;   (define (rec M m l)
  ;;     (if (pair? l)
  ;; 	  (rec (max M (car l))
  ;; 	       (min m (car l))
  ;; 	       (cdr l))
  ;; 	  (/ (+ 0. M m) 2)))
  ;;   (rec (car L) (car L) (cdr L)))
  (define (sorted? l)
    (if (and (pair? l)
	     (pair? (cdr l)))
	(and (<= (car l) (cadr l))
	     (sorted? (cdr l)))
	#t))
  (define (divide2 left right l pivot)
    (cond ((not (pair? l))
	   (list (quicksort left) (quicksort right)))
	  ((< (car l) pivot)
	   (divide2 (cons (car l) left)
		   right
		   (cdr l)
		   pivot))
	  (else (divide2 left
			(cons (car l) right)
			(cdr l)
			pivot))))
  
  (if (sorted? L)
      L
      (let* ((S (divide2 '() '() L (get-pivot2))))
	(merge (car S) (cadr S)))))

(verifier quicksort
	  (quicksort '(3 2 1)) => (1 2 3)
	  (quicksort '(1)) => (1)
	  (quicksort '()) => ()
	  )

(trace quicksort)
(trace merge)
(trace divide)

(quicksort '(9 8 7 6 5 2 0 2 1 3))


;;; sort: (alpha * alpha -> bool) * LISTE[alpha] -> LISTE[alpha]
;;; (sort < L) rend la liste triée des éléments de L vis-à-vis
;;; du comparateur <
(define (sort < L)
  (define (reverse l)
    (if (pair? l)
	(append (reverse (cdr l)) (list (car l)))
	'()))
  (let ((rev (< 2 1))
	(S (quicksort L)))
    (if rev
	(reverse S)
	S)))

(verifier sort
	  (sort < (list 1 4 2)) => (1 2 4)
	  (sort > (list 1 4 2)) => (4 2 1)
	  )


