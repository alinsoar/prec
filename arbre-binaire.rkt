


(define (ab-vide) '*ab-empty*)
(define (ab-noeud x gauche droit) (list x gauche droit))

(define (ab-etiquette ab) (car ab))
(define (ab-gauche ab) (cadr ab))
(define (ab-droit ab) (caddr ab))

(define (ab-vide? arbre) (not (ab-noeud? arbre)))
(define (ab-noeud? ab)
  (define (length L)
    (if (pair? L) (+ 1 (length (cdr L))) 0))
  (and (list? ab)
       (= 3 (length ab))))


