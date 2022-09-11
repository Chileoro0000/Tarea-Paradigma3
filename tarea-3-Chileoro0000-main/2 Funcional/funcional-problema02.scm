(load "data.scm")


(define (imprimir l v c)
  (display v)
  (display " -> ")
  (print c)
  )


(define (verificar2 l v c)
  (if (null? l)
      (imprimir l v c)
      (calcular l v c)
      )
  )

(define (calcular lista valorRepetido c)
  (cond
   [(= (length lista) 1) (cond
                          [(= valorRepetido (car lista)) (verificar2 (cdr lista) valorRepetido (+ c 0))]
                          [else (verificar2 (cdr lista) valorRepetido (+ c 0))])]
   
   [(= valorRepetido (car (cdr lista))) (verificar2 (cdr lista) valorRepetido (+ c 1))]
   [else (verificar2 (cdr lista) valorRepetido (+ c 0))]
   )
  )

(define (verificar l)
  (if (null? l)
      0
      (contador l)
      )
  )

(define (contador lista)
  (calcular (car lista) (caar lista) 0)
  (verificar (cdr lista))
  )


(define (main)
  (newline)
  (print "Para Uno")
  (contador uno)
  (newline)
  (print "Para Dos")
  (contador dos) 
  (newline)
  (print "Para Tres")
  (contador tres)
  )

(main)


