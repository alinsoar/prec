
;; Énoncé

;; [sierpinski] Dessin de triangles de Sierpinski

;; Écrire une fonction nommée sierpinski qui prend un entier (le rang
;; du triangle à engendrer) et les coordonnées des 3 sommets du
;; triangle circonscrit. Un triangle entièrement noir correspond au
;; rang 0, voici des triangles de rang 1 et 2:

;; Pour cet exercice, aucun test n'est exigé mais vous pouvez tirer
;; grand profit de la carte de référence graphique jointe.

(require lang/posn)

(require 2htdp/image)


(define (avg . l) (/ (apply + l) (length l)))

(define (tri x1 y1 x2 y2 x3 y3)
  (put-pinhole
   (- (avg x1 x2 x3) (min x1 x2 x3))
   (- (avg y1 y2 y3) (min y1 y2 y3))
   (polygon (list (make-posn x1 y1)
                  (make-posn x2 y2)
                  (make-posn x3 y3))
            'solid
            "blue")))

(define (sierpinski x1 y1 x2 y2 x3 y3 n)
  (if (= n 0)
      empty-image
      (let ((m3 (cons (avg x2 x1)    (avg y2 y1)))
            (m1 (cons (avg x3 x2)    (avg y3 y2)))
            (m2 (cons (avg x1 x3)    (avg y1 y3)))
            (c  (cons (avg x1 x2 x3) (avg y1 y2 y3)))
	    (left-x (min x1 x2 x3))
	    (left-y (min y1 y2 y3)))
	
	(define (x w) (car w))
	(define (y w) (cdr w))
	
	(define (make-center c m1 m2 m3 pic)
	  (make m1 m2 (x m3) (y m3)
		(put-pinhole
		 (- (avg (x m1) (x m2) (x m3)) (min (x m1) (x m2) (x m3)))
		 (- (avg (y m1) (y m2) (y m3)) (min (y m1) (y m2) (y m3)))
		 (polygon (list (make-posn (x m1) (y m1))
				(make-posn (x m2) (y m2))
				(make-posn (x m3) (y m3)))
			  100
			  "yellow"))
		pic))
	
	(define (make m1 m2 a b pic pic-up)
	  (overlay/pinhole
	   pic
	   (put-pinhole
	    (- (avg (x m1) (x m2) a) left-x)
	    (- (avg (y m1) (y m2) b) left-y)
	    pic-up)))
	
	(make-center c m1 m2 m3
		     (make m2 m3 x1 y1
			   (sierpinski x1 y1 (x m2) (y m2) (x m3) (y m3) (- n 1))
			   (make m1 m3 x2 y2
				 (sierpinski (x m1) (y m1) x2 y2 (x m3) (y m3) (- n 1))
				 (make m1 m2 x3 y3
				       (sierpinski (x m1) (y m1) (x m2) (y m2) x3 y3 (- n 1))
				       (tri x1 y1 x2 y2 x3 y3))))))))

(clear-pinhole (scale 3 (sierpinski 200 29 30 134 290 288 9)))

