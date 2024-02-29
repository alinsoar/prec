;; Énoncé

;; [dragon] Courbe du dragon

;; Écrire une fonction nommée dragon qui dessine la courbe dite du
;; dragon. La courbe se dessine comme suit. On choisit 2 points A et B
;; de coordonnées xa, ya et xb, yb. On détermine le point M tel que le
;; triangle AMB soit isocèle rectangle en M, on dessine la courbe du
;; dragon entre A et M puis entre B et M. les coordonnées de M sont
;; xm, ym définies comme suit:

;; (let ((xm (+ (/ (+ xa xb) 2) (/ (- yb ya) 2)))
;;       (ym (- (/ (+ ya yb) 2) (/ (- xb xa) 2))) ) 
;;   ... )  

;; Afin d'arrêter la régression infinie on ajoute un paramètre rang
;; tel que lorsqu'il est égal à 1, la courbe se réduit au segment
;; AB. Les appels récursifs à la courbe du dragon s'effectuent en
;; décrémentant le rang. Voici les courbes des dragonneaux de rang 2
;; et 3 puis celle d'un dragon de rang 11:


(require lang/posn)

(require 2htdp/image)

(define (dragon xa ya xb yb n)
  (if (= n 0)
      (list (list xb yb xa ya))
      (let ((xm (+ (/ (+ xa xb) 2) (/ (- yb ya) 2)))
            (ym (- (/ (+ ya yb) 2) (/ (- xb xa) 2))) )
        (append (dragon xb yb xm ym  (- n 1))
                (dragon xa ya xm ym (- n 1)))
        )))

(define X 200)
(define Y 300)

(define (draw-dragon xa ya xb yb n)
  (define (rec s l)
    (if (null? l)
        s
        (let ((p (car l)))
          (let ((x-a (first p))
                (y-a (second p))
                (x-b (third p))
                (y-b (fourth p)))
            (rec
             (scene+line
              s
              (+ x-a X)
              (+ y-a Y)
              (+ x-b X)
              (+ y-b Y)
              "red")
             (cdr l))))))
  
  (let ((points (dragon xa ya xb yb n))
        (pic (empty-scene 800 800)))
    (rec pic points)))

(draw-dragon 0 0 300 300 15)
