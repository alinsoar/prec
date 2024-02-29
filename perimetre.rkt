

;; Énoncé
;; [perimetre] Calcul du périmètre d'un rectangle
;; Écrire une fonction nommée perimetre qui prend, en arguments, la
;; longueur et la largeur d'un rectangle et calcule son périmètre.


;;; Nombre * Nombre -> Nombre
(define (perimetre longueur largeur)
   (* 2 (+ longueur largeur) ) )

(verifier perimetre
  (perimetre 0 1) => 2
  (perimetre 1 1) => 4
  (perimetre 2 1) => 6
)
