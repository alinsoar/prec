
;; Énoncé

;; [intervalle] Construction d'un intervalle d'entiers

;; Écrire une fonction nommée intervalle qui prend deux entiers
;; relatifs debut et fin tels que debut est inférieur ou égal à fin et
;; qui construit la liste (debut debut+1 ... fin). Ainsi (intervalle
;; -2 4) rend (-2 -1 0 1 2 3 4).

;; Écrire une fonction nommée intervalle-gen qui prend deux entiers
;; relatifs debut et fin et qui construit la liste des entiers compris
;; entre debut et fin. Ainsi (intervalle-gen 2 3) rend (2 3) mais
;; (intervalle-gen 3 2) rend ().


;;; ...
(define (intervalle debut fin)
  (if (> debut fin)
      '()
      (cons debut (intervalle (+ 1 debut) fin))))

(verifier intervalle
	  (intervalle -2 4) => (-2 -1 0 1 2 3 4)
	  (intervalle 0 1) => (0 1)
	  (intervalle 3 -1) => ()
	  )


;;; ...
(define (intervalle-gen debut fin)
  (intervalle debut fin))

(verifier intervalle-gen
	  (intervalle-gen -2 4) => (-2 -1 0 1 2 3 4)
	  (intervalle-gen 0 1) => (0 1)
	  (intervalle-gen 3 -1) => ()
	  )


