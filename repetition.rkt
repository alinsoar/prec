
;; Énoncé

;; [repetition] Fabrication d'une liste par répétition

;; Écrire une fonction nommée repetition qui prend un entier naturel n
;; et une valeur quelconque terme et qui construit une liste contenant
;; n fois cette valeur. Ainsi (repetition 3 "ah") rend ("ah" "ah"
;; "ah").

;;; 
(define (repetition n terme)
  (if (= n 0)
      '()
      (cons terme (repetition (- n 1) terme))))

(verifier repetition
	  (repetition 3 "ah" ) => ("ah" "ah" "ah") 
	  (repetition 0 0) => ()
	  (repetition 1 0) => (0)
	  )





