
;; Énoncé
;; [max3] Trouver le plus grand nombre parmi trois.
;; Écrire une fonction nommée le-plus-grand qui prend 3 nombres en
;; arguments et qui a pour résultat le plus grand de ces trois
;; nombres. Ainsi (le-plus-grand 44 22 56) a pour valeur 56.
;; Nota: la fonction max n'est pas disponible.


;;; Nombre * Nombre * Nombre -> Nombre
;;; (le-plus-grand x y z) rend le plus grand nombre parmi x, y et z.
(define (le-plus-grand x y z)
  (if (> x y)
      (if (> x z) x z)
      (if (> y z) y z)))

(verifier le-plus-grand
  (le-plus-grand 1 2 3) => 3
  (le-plus-grand 1 4 3) => 4
  (le-plus-grand 1 -2 3) => 3
  (le-plus-grand 1 -2 -3) => 1
  )




