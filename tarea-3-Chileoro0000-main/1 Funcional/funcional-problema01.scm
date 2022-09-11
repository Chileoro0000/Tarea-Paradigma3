(load "notas.scm")

;Funcion suma lista Greco.
(define (sumalista l)
  (if (null? l)
      0
      (+ (car l)(sumalista (cdr l)))
      )
  )

(define (promedio lista)
  (/ (sumalista lista) (length lista))
  )

(define (imprimir_promedios notasI)
  (define media (promedio (car (cdr notasI))))
  (display (car notasI))
  (display " ")
  (print media)
)

(define veces1 (list 1))
(define veces2 (list 1 1))
(define veces3 (list 1 1 1))

(define (verificar2 l)
  (if (null? l)
      (display "Promedios calculados\n")
      (verificar_notas l)
      )
  )

(define (verificar_notas lista)
  (cond 
   [(= (length (cdr (car lista))) 2) (imprimir_promedios (list (caar lista) (append (cdr (car lista)) veces1)))] 
   [(= (length (cdr (car lista))) 1) (imprimir_promedios (list (caar lista) (append (cdr (car lista)) veces2)))]
   [(= (length (cdr (car lista))) 0) (imprimir_promedios (list (caar lista) (append (cdr (car lista)) veces3)))]
   [else (imprimir_promedios (list (caar lista) (cdr (car lista))))]
   )
  (verificar2 (cdr lista))
)

(define (main lista-principal)
  (verificar_notas lista-principal)
  )

(main notas)

















