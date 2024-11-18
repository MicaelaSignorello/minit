import wollok.game.*
import mapa.*

object zarek {

    var property image = "mica.png"
    var property position = game.at(2, 2)

    var property tieneCorazon = false
    var property tieneEspada = false

    //   method position() = if (centrado) game.center() else game.origin()

    method tomarCorazon(){
        zarek.tieneCorazon(true)
        game.removeVisual(corazon) // Deberia ser: espada.remover() ? ? ?
    }

    method tomarEspada(){
        zarek.tieneEspada(true)
        espada.remover() // Idem metodo anterior, ver cual queda.
    }

    method mover(unaDirec){
        if (unaDirec == "arriba"){
            
        }
    }
    //  No se como sintetizar el codigo de abajo... If's anidados??

    method moverArriba(){
        var tempPos = game.at(position.x(), 10.min(position.y() + 1))
        self.position(tempPos) //game.at(position.x(), 10.min(position.y() + 1))
    }

    method moverAbajo(){
        var tempPos = game.at(position.x(), 10.min(position.y() - 1))
        self.position(tempPos)
    }

    method moverDer(){
        var tempPos = game.at(position.x() +1, 10.min(position.y()))
        self.position(tempPos)
    }

    method moverIzq(){
        var tempPos = game.at(position.x() -1, 10.min(position.y()))
        self.position(tempPos)
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
    

    method position(prediccionPosicion){
	var area = []
	
	//Colisiones:
	
		//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
			area = game.getObjectsIn(prediccionPosicion).filter({ visual => visual.nombre() == "pared"})
			
		//Si no se detecta ninguna pared con la colección, simplemente pase a la posición predecida:
			if (area.size() == 0){
				position = prediccionPosicion
			}
    }
}

object keyConfig {
    method init(){
        keyboard.up().onPressDo({
            zarek.moverArriba()
        })

        keyboard.down().onPressDo({
            zarek.moverAbajo()
        })

        keyboard.right().onPressDo({
            zarek.moverDer()
        })

        keyboard.left().onPressDo({
            zarek.moverIzq()
        })
    }
}
//object opuestoDireccion {
//    var property direccion = "izquierda"
//
//    method direccionOpuesta() { 
//        var direccionResultante= ""
//        if (direccion == "arriba" )
//            direccionResultante = "abajo"
//        else if (direccion == "derecha" )
//            direccionResultante = "izquierda"
//        else if (direccion == "abajo" )
//            direccionResultante = "arriba"
//        else 
//            direccionResultante = "derecha"
//
//        return direccionResultante
//    }
//}


object controlDeColisiones {
    method init(){
        game.onCollideDo(corazon, {zarek => zarek.tomarCorazon()})
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

//Motor de colisión:


object arbolPrueba {
    var property position = game.at(6, 6)
    var property image = "arbol.png"
}

object ogroPrueba {
    var property position = game.at(6, 8)
    var property image = "ogro.png"
}