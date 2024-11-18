import wollok.game.*
import mapa.*

object zarek {
    var property image = "mica.png"
    var property position = game.at(2, 2)

    var property tieneCorazon = false
    var property tieneEspada = false

    var property orientacion = 0
	
	//var property arriba = 0
	//var property abajo = 1
	//var property izquierda = 2
	//var property derecha = 3

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
    //  No se como sinstetizar el codigo de abajo... If's anidados??

    method moverArriba(){
        var tempPos = game.at(position.x(), 10.min(position.y() + 1))
        self.position(tempPos) //game.at(position.x(), 10.min(position.y() + 1))
        orientacion = 1
    }

    method moverAbajo(){
        var tempPos = game.at(position.x(), 10.min(position.y() - 1))
        self.position(tempPos)
        orientacion = 2
    }

    method moverDer(){
        var tempPos = game.at(position.x() +1, 10.min(position.y()))
        self.position(tempPos)
        orientacion = 3
    }

    method moverIzq(){
        var tempPos = game.at(position.x() -1, 10.min(position.y()))
        self.position(tempPos)
        orientacion = 4
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

        self.giro()
    }

    method giro(){
		
		if (orientacion == 1){
			image = "jugador1.png"
		}
		
		if (orientacion == 2){
			image = "jugador.png"
		}
		
		if (orientacion == 3){
			image = "jugador3.png"
		}
		
		if (orientacion == 4){
			image = "jugador2.png"
		}
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

object arbolPrueba {
    var property position = game.at(6, 6)
    var property image = "arbol.png"
}

object ogro {
    var property position = game.at(17, 2)
    var property image = "ogro.png"
}

object principe {
    var property position = game.at(21, 4)
    var property image = "principe.png"
}