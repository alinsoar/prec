
;; Énoncé

;; [croissante] Déterminer si une liste est croissante

;; Écrire un prédicat nommé croissante? qui prend une liste de nombres
;; et vérifie si la liste est croissante. Ainsi (croissante? (list 2
;; 5.0 5.0 72.8)) est vraie ce que n'est pas (croissante? (list 4 5.5
;; 1 6)).


;;; ...
(define (croissante? L)
  (if (or (not (pair? L))
	  (not (pair? (cdr L))))
      #t
      (and (<= (car L) (cadr L))
	   (croissante? (cdr L)))))

(verifier croissante?
	  (croissante? '(4 5.5 1 6)) => #f
	  (croissante? '()) => #t
	  (croissante? '(0)) => #t
	  (croissante? '(1 0)) => #f
	  (croissante? (list 2 5.0 5.0 72.8)) => #t
	  )

