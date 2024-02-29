
;; Énoncé
;; [cube] Calcul du cube d'un nombre
;; Écrire une fonction nommée cube qui prend un nombre et rend son
;; cube, ce nombre élevé à la puissance troisième. Ainsi (cube 2) vaut
;; 8.


;; Numbre -> Nombre
(define (cube x)
  (* x x x) )

(verifier cube
  (cube 1) => 1
  (cube -2) => -8
  (cube 1.1) => 1.331
)

