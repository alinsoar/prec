
;; Énoncé

;; [nombre-occurrences] Compter le nombre d'occurrences d'une valeur
;; dans une liste

;; Écrire une fonction nommée nombre-occurrences qui prend une valeur
;; et une liste de valeurs et qui compte le nombre de fois que cette
;; valeur apparaît dans cette liste. Ainsi (nombre-occurrences "me"
;; (list "me" "my" "mine" "me")) rend 2.



(define (nombre-occurrences e L)
  (cond ((not (pair? L)) 0)
	((equal? e (car L))
	 (+ 1 (nombre-occurrences e (cdr L))))
	(else (nombre-occurrences e (cdr L)))))

(verifier nombre-occurrences
	  (nombre-occurrences 0 '(1 2 3)) => 0
	  (nombre-occurrences 0 '(0 1 2 0 1 2 3 0) ) => 3
	  (nombre-occurrences 0 '(1 0)) => 1
	  (nombre-occurrences "me" (list "me" "my" "mine" "me")) => 2
	  )



