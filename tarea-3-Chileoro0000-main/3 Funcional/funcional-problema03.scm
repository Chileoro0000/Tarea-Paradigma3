(load "data.scm")

;Funcion para imprimir el contenido encontrado en cache
(define (retornarValor cache)
  (display "El contenido es --> ")
  (print (cdr (car cache)))
  )

;Verificar que la lista no este vacia, si llega a estar vacia,
;significa que ya NO encontro la contraseña en cache
(define (verificar cache clave)
  (if (null? cache)
      "NoEncontradoEnCache"
      (buscarEnLista cache clave)
      )
  )

;busca en el cache la contraseña
(define (buscarEnLista cache clave)
  (cond
    [(equal? (caar cache) clave) (retornarValor cache)]
    [else (verificar (cdr cache) clave)]
   )
  )

;Verifica que la base de datos no este vacia y si llega a estarlo
;significa que no encontro la contraseña en la base de datos.
(define (verificarBase baseDeDatos clave cache)
  (if (null? baseDeDatos)
      (print "NoEncontrado")
      (buscarEnBase baseDeDatos clave cache)
      )
  ) 

;devuelve lo encontrado en la base de datos y ademas ingresa lo encontrado al cache actualizado para este cache se puede
(define (retornarYañadir cache baseDeDatos)
  (display "El contenido es --> ")
  (print (cdr (car baseDeDatos)))
  (set! Cache (append cache (car baseDeDatos)))
  )

;busca en la basededatos la contraseña
(define (buscarEnBase baseDeDatos clave cache)
  (cond
    [(equal? (caar baseDeDatos) clave) (retornarYañadir cache baseDeDatos)]
    [else (verificarBase (cdr baseDeDatos) clave cache)]
   )
  )

;Funcion principal
(define (buscarClave clave baseDeDatos cache)
  (cond [(equal? (buscarEnLista cache clave) "NoEncontradoEnCache") (buscarEnBase baseDeDatos clave cache)]
        )
  )

;Aca si se quiere modificar se puede guardar el cache abajo
;de esa manera tener el resultado del cache actualizado
(buscarClave Clave BaseDeDatos Cache)


; Imprime el cache actualizado (print Cache)
