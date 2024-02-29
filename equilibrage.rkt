
;; Énoncé

;; [equilibrage] Équilibrage d'arbres binaires

;; Travailler avec des arbres binaires presque à l'équilibre est
;; recommandé. Un arbre binaire est quasi-équilibré lorsque, pour tout
;; noeud, la différence des hauteurs du fils droit et du fils gauche
;; est au plus égale à un.

;; Écrire une fonction nommée mediane qui prend une liste non vide de
;; nombres tous différents et rend un de ces nombres m tel qu'il y a
;; autant de valeurs inférieures ou égales à m que de valeurs
;; supérieures (à une valeur près). Ainsi (mediane (list 1 7 11 3 2 5
;; 9)) peut-il rendre 3 ou 5. La réponse 3 est possible car 1, 2 et 3
;; sont 3 nombres inférieurs ou égaux à 3 tandis que les 4 nombres 5,
;; 9, 7 et 11 sont supérieurs strictement à 3. La réponse 5 est
;; possible car 1, 2, 3 et 5 sont 4 nombres inférieurs ou égaux à 5
;; tandis que les 3 nombres 9, 7 et 11 sont supérieurs strictement à
;; 5.

;; Écrire un prédicat nommé ab-quasi-equilibre? qui prend un arbre
;; binaire et vérifie s'il est quasi-équilibré.

;; Écrire une fonction nommée ab-quasi-equilibre qui prend une liste
;; de nombres tous différents et rend un arbre binaire quasi-équilibré
;; contenant tous ces nombres (et seulement ces nombres).

(load "arbre-binaire.rkt")

(define (length L)
    (define (f x y) (+ 1 y))
    (define (null? x) (not (pair? x)))
    (define (reduce f init L) (if (null? L) init (f (car L) (reduce f init (cdr L)))))
    (reduce f 0 L))

(define (mediane L)
  (define (insert a l)
    (cond ((not (pair? l)) (list a))
          ((>= a (car l)) (cons a l))
          (else (cons (car l)
                      (insert a (cdr l))))))
  (define (rec l v)
    (if (pair? l)
        (rec (cdr l) (insert (car l) v))
        v))
  (define (med l k)
    (if (= k 0)
        (car l)
        (med (cdr l) (- k 1))))
  (let ((s (rec L '())))
    (med s (quotient (length L) 2))))

(verifier mediane
          (mediane '(3 1) ) => 1
          (mediane '(3 2) ) => 2
          (mediane '(3 2 1 3) ) => 2
          (mediane '(1 2 3) ) => 2
          (mediane '(2 1) ) => 1
          )



(define (ab-quasi-equilibre? AB)
  (define (epaisseur ab)
    (if (ab-noeud? ab)
        (+ 1
           (max (epaisseur(ab-gauche ab))
                (epaisseur(ab-droit ab))))
        0))
  (define (rec ab)
    (if (ab-noeud? ab)
        (let ((e1 (epaisseur (ab-gauche ab)))
              (e2 (epaisseur (ab-droit ab))))
          (and (<= (abs (- e1 e2)) 1)
               (rec (ab-gauche ab))
               (rec (ab-droit ab))))
        #t))
  (rec AB))

(verifier ab-quasi-equilibre?
          (ab-quasi-equilibre? (ab-vide) ) => #t
          (ab-quasi-equilibre? (ab-noeud 2
                                         (ab-vide)
                                         (ab-vide))) => #t
          (ab-quasi-equilibre? (ab-noeud 2
                                         (ab-vide)
                                         (ab-noeud 2
                                                   (ab-vide)
                                                   (ab-vide)))) => #t
          (ab-quasi-equilibre? (ab-noeud 2 
                                         (ab-vide)
                                         (ab-noeud 2
                                                   (ab-vide)
                                                   (ab-noeud 2
                                                             (ab-vide)
                                                             (ab-vide))))) => #f
          )

(define (ab-quasi-equilibre L)
  (define (mediane L)
    (define (insert a l)
      (cond ((not (pair? l)) (list a))
            ((>= a (car l)) (cons a l))
            (else (cons (car l)
                        (insert a (cdr l))))))
    (define (rec l v)
      (if (pair? l)
          (rec (cdr l) (insert (car l) v))
          v))
    (define (med l l0 k)
      (if (= k 0)
          (list l l0)
          (med (cdr l)
               (cons (car l) l0)
               (- k 1))))
    (let ((s (rec L '())))
      (med s '() (quotient (+ 1 (length L)) 2))))
  (if (pair? L)
      (let* ((m (mediane L))
             (gauche (car m))
             (droit (cdadr m))
             (med (caadr m)))
        (ab-noeud
         med
         (ab-quasi-equilibre gauche)
         (ab-quasi-equilibre droit) ))
      (ab-vide)))

(verifier ab-quasi-equilibre
          (equal?
           (ab-quasi-equilibre '())
           (ab-vide)
           ) => #t
          (equal?
           (ab-quasi-equilibre '(1) )
           (ab-noeud 1 (ab-vide) (ab-vide))
           ) => #t
          (equal?
           (ab-quasi-equilibre '(2 1) )
           (ab-noeud 2 (ab-noeud 1 (ab-vide) (ab-vide)) (ab-vide))
           ) => #t
          )


