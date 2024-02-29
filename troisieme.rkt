;; Énoncé

;; [troisieme] Troisième élément d'une liste

;; Écrire un semi-prédicat nommé troisieme qui prend une liste et rend
;; son troisième élément ou Faux s'il n'y a pas de troisième
;; élément. Ainsi (troisieme (list 1 2 3 4)) rend 3 tandis que
;; (troisieme (list 1 2)) rend #f.


;;; troisieme: List[alpha] -> alpha + #f
;;; (troisieme L) ...
(define (troisieme L)
  (and (pair? L)
       (pair? (cdr L))
       (pair? (cdr (cdr L)))
       (car (cdr (cdr L)))))


(verifier troisieme
	  (troisieme '() ) => #f
	  (troisieme '(0) ) => #f
	  (troisieme '(1 2) ) => #f
	  (troisieme '(0 1 2) ) => 2
	  )




