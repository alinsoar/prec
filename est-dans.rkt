

;; Énoncé

;; [est-dans] Présence d'un terme dans une liste

;; Écrire un prédicat nommé est-dans? qui prend une valeur et une
;; liste de valeurs et qui vérifie si cette valeur apparaît dans cette
;; liste. Ainsi (est-dans? "bc" (list "a" "bc" "def")) est vrai.


(define (est-dans? e L)
  (if (not (pair? L))
      #f
      (or (equal? e (car L))
	  (est-dans? e (cdr L)))))

(verifier est-dans?
	  (est-dans? 0 '(1 2)) => #f
	  (est-dans? "bc" (list "a" "bc" "def")) => #t
	  )


