import wollok.game.*

object zarek {

    var property image = "mica.png"

    //method image() = "mica.png"
    var property position = game.at(2, 2)

    //   method position() = if (centrado) game.center() else game.origin()

    method moverArriba(){
        position = game.at(position.x(), position.y() + 1)
    }

    method moverAbajo(){
        position = game.at(position.x(), position.y() - 1)
    }

    method moverDer(){
        position = game.at(position.x() + 1, position.y())
    }

    method moverIzq(){
        position = game.at(position.x() -1, position.y())
    }
}

object keyConfig {
    method init(){
        keyboard.up().onPressDo({
            zarek.moverArriba()
            unltimaDireccion.direccion("arriba") 
        })

        keyboard.down().onPressDo({
            zarek.moverAbajo()
            unltimaDireccion.direccion("abajo") 
        })
        
        keyboard.right().onPressDo({
            zarek.moverDer()
            unltimaDireccion.direccion("derecha") 
        })

        keyboard.left().onPressDo({
            zarek.moverIzq()
            unltimaDireccion.direccion("izquierda") 
        })
    }
}
object unltimaDireccion {
    var property direccion = "izquierda"

    method dirceccionOpuesta() { 
        var direccionResultante= ""
        if (direccion == "arriba" )
            direccionResultante = "abajo"
        else if (direccion == "derecha" )
            direccionResultante = "izquierda"
        else if (direccion == "abajo" )
            direccionResultante = "arriba"
        else 
            direccionResultante = "derecha"
    }
}

object controlDeColisiones {
    method init(){
        game.whenCollideDo(piedra, {
            zarek => zarek.moverAbajo()
        })
    }
method colicionHacialaDerecha() {
  
}

}




/*
object controlDeColisiones {
    method inicializar(enemigo){
        game.onCollideDo(enemigo, {
            personaje => personaje.descontarVida()
            personaje.position(controlDeMovimientos.defaultPosition())
            }
        )       
    }
}
*/

object piedra {
    method image() = "piedra.png"
    var property position = game.at(2, 6)
}
