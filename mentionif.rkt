
;; [mentionif] Déterminer la mention associée à une note.

;; Donner la spécification et une définition de la fonction mention
;; qui étant donnée une note sur 20 rend la mention associée sous
;; forme de chaîne de caractères. Votre définition devra utiliser
;; uniquement des alternatives. Voici les mentions données par
;; intervalle de notes : une note strictement inférieure à 10 donne la
;; mention "Insuffisant", entre 10 et 12 (exclus) la mention
;; "Passable", entre 12 et 14 (exclus) la mention "Assez Bien" est
;; obtenue, entre 14 et 16 (exclus) c'est la mention "Bien", et toute
;; note supérieure ou égale à 16 correspond à la mention "Excellent".

;; Dans cet exercice, la conditionnelle cond n'est pas autorisée.

;;; mention : nombre -> string
;;; (mention x) rend la mention associée a une note
;;; HYPOTHÈSE: 20 >= x >= 0
(define (mention x)
  (cond ((< x 10) "Insuffisant")
	((< x 12) "Passable")
	((< x 14) "Assez Bien")
	((< x 16) "Bien")
	(else "Excellent") ) )

;;; mention : nombre -> string
;;; (mention x) rend la mention associée a une note
;;; HYPOTHÈSE: 20 >= x >= 0
(define (mention x)
  (if (< x 10)
      "Insuffisant"
      (if (< x 12)
	  "Passable"
	  (if (< x 14)
	      "Assez Bien"
	      (if (< x 16)
		  "Bien"
		  "Excellent")))))

(verifier mention
	  (mention 0 ) => "Insuffisant" 
	  (mention 10) => "Passable"
	  (mention 12) => "Assez Bien"
	  (mention 14) => "Bien"
	  (mention 16) => "Excellent"
 )
