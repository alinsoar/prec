
;; Énoncé

;; [sapin] Dessin d'un sapin.

;; Écrire une fonction nommée sapin qui rend une image dans laquelle
;; est dessiné un sapin. Voici un exemple de sapin


;; Pour cet exercice, aucun test n'est exigé mais vous pouvez tirer
;; grand profit de la carte de référence graphique jointe.


(require lang/posn)
(require 2htdp/image)

(define colors '("white" "yellow" "cyan" "red" "white" "brown"
		 "seagreen" "aquamarine" "slateblue" "lightseagreen"
		 "darkmagenta" "darkred" "cornflowerblue" "darkslategray"
		 "red"))

(define tri
  (put-pinhole
   50 60
   (polygon (list (make-posn   0    0)
                  (make-posn -50  100)
                  (make-posn  50  100) )
            200
            "green")))

(define (sapin n)
  (define (rec pic n)
    (if (= n 0)
        pic
        (put-pinhole
         (* n 50)
         (* n 50)
         (overlay/pinhole
          (rec pic (- n 1))
          (put-pinhole (* 50 n)
                       0
                       (scale n pic))))))
  (clear-pinhole (rec tri n)))

(sapin 10)

(clear-pinhole
 (overlay/pinhole
  (put-pinhole
   50 50
   (circle 50 50 "red"))
  (put-pinhole
   30 30
   (circle 30 "outline" "yellow"))
  (put-pinhole
   15 10
   (rectangle 30 20 "outline" "blue"))))



;;; in MrScheme

;;; sapin:   -> Image
;;; (sapin) rend une image de sapin
(define (sapin)
   (overlay (triangle 0 1 .5 0 -.5 0)
            (triangle 0 .5 .5 -.5 -.5 -.5)
            (triangle 0 0 .5 -1 -.5 -1)
            ))

(sapin) ; Derniere expression pour creer l'image du sapin.
