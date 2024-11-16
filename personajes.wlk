import wollok.game.*
import mapa.*

object zarek {

    var property image = "mica.png"

    //method image() = "mica.png"
    var property position = game.at(2, 2)

    //   method position() = if (centrado) game.center() else game.origin()

    method moverArriba(){
        position = game.at(position.x(),
        10.min(position.y() + 1))
    }

    method moverAbajo(){
        position = game.at(
        position.x(),
        0.max(position.y() - 1)
        )
    }

    method moverDer(){
        position = game.at(
            24.min(position.x() + 1),
            position.y())
    }

    method moverIzq(){
        position = game.at(
            0.max(position.x() -1),
            position.y()
        )
    }

    method moverDireccion(unaDirec){
        if (unaDirec == "arriba")
            self.moverArriba()
        else if (unaDirec == "abajo")
            self.moverAbajo()
        else if (unaDirec == "derecha")
            self.moverDer()
        else
            self.moverIzq()
    }
    
}

object keyConfig {
    method init(){
        keyboard.up().onPressDo({
            zarek.moverArriba()
            opuestoDireccion.direccion("arriba") 
        })

        keyboard.down().onPressDo({
            zarek.moverAbajo()
            opuestoDireccion.direccion("abajo") 
        })

        keyboard.right().onPressDo({
            zarek.moverDer()
            opuestoDireccion.direccion("derecha") 
        })

        keyboard.left().onPressDo({
            zarek.moverIzq()
            opuestoDireccion.direccion("izquierda") 
        })
    }
}
object opuestoDireccion {
    var property direccion = "izquierda"

    method direccionOpuesta() { 
        var direccionResultante= ""
        if (direccion == "arriba" )
            direccionResultante = "abajo"
        else if (direccion == "derecha" )
            direccionResultante = "izquierda"
        else if (direccion == "abajo" )
            direccionResultante = "arriba"
        else 
            direccionResultante = "derecha"

        return direccionResultante
    }
}

object controlDeColisiones {
    method init(){
        game.onCollideDo(TipoPared, {
            zarek => zarek.moverDireccion(opuestoDireccion.direccionOpuesta())
        })
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