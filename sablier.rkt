
;; Énoncé

;; [sablier] Dessin d'un sablier

;; Écrire une fonction nommée sablier qui dessine un sablier (deux
;; triangles se faisant face) quelque-chose comme:


;; Pour cet exercice, aucun test n'est exigé mais vous pouvez tirer
;; grand profit de la carte de référence graphique jointe.



;;; This is locally, in racket

(require 2htdp/image)

(above
 (rotate 180 (isosceles-triangle 300 60 "solid" "aquamarine"))
 (isosceles-triangle 300 60 "solid" "aquamarine"))

;;; This is for the online interface of MrScheme. Does not work in
;;; racket.

;;; sablier:     -> Image
;;; (sablier) fabrique l'image d'un sablier
(define (sablier)
   (overlay (triangle 0 0 1 1 -1 1)
            (triangle 0 0 1 -1 -1 -1)))
            

(sablier) ; Derniere expression pour creer l'image du sablier.
            
