import wollok.game.*
import mapa.*
import interfaz.*
import zarek.*

object ogro {
    var property position = game.at(16, 2)
    var property image = "ogro.png"
    var property nombre = "ogro"

    method morir(){
        position = game.at(17, 3)
        image = "ogroMuerto.png"
    }

    method interaccion(){
        if (zarek.tieneEspada()){
            ogro.morir()
            game.removeVisual(triggerOgro)
        } else {
            zarek.moverIzq()
        }
    }
}

object triggerOgro {
    var property position = game.at(15, 2)
    var property image = "mica.png"
    var property nombre = "invisible"

    method msg(){
        var texto = "                                                                       Necesitas una espada para derrotar al Ogro."
        if (zarek.tieneEspada()){
            texto = "Derrotaste al Ogro."
        }
        const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
    }
}


object principe {
    var property position = game.at(21, 4)
    var property image = "principe2.png"
}

object duende {
	var property position = game.at(2, 1)
	var property image = "duende.png"
}

object corazon {
    var property position = game.at(12, 9)
    var property image = "corazon.png"
	var property nombre = "corazon"

	method remover(){
		game.removeVisual(self)
	}
}

object espada {
	var property position = game.at(4, 10)
	var property image = "espada.png"
	var property nombre = "espada"

	method remover(){
		game.removeVisual(self)
	}
}

object hacha {
	var property position = game.at(1, 1)
	var property image = "hacha.png"
	var property nombre = "hacha"

	method remover(){
		game.removeVisual(self)
	}
}

object puerta{
	var property position = game.at(2, 8)
	var property image = "cerreada.png"
	var property nombre = "puerta"

	method interaccion(){
		if (zarek.tieneLlave()){
			image = "abierta.png"
			game.removeVisual(triggerPuerta)
		} else {
			zarek.moverAbajo()
		}
	}
}

object triggerPuerta{
	var property position = game.at(2, 7)
	var property image = "mica.png"
	var property nombre = "triggerPuerta"

	    method msg(){
        	var texto = "Necesitas la llave para abrir la puerta."
        	if (zarek.tieneLlave()){
        	    texto = "Puede Avanzar"
        	}
        	const mensaje = new Mensaje(text = texto)
        	game.addVisual(mensaje)
        	game.schedule(3500, {game.removeVisual(mensaje)})
	}
}

object llave{
	var property position = game.at(23, 9)
	var property image = "llave.png"
	var property nombre = "llave"

	method remover(){
		game.removeVisual(self)
	}
}

object arbolCaido{
	var property position = game.at(20, 9)
	var property image = "arbol.png"
	var property nombre = "arbolCaido"

	method interaccion(){
		if (zarek.tieneHacha()){
			image = "arbolCaido.png"
			nombre = "arbolCaido"
		} else {
			zarek.moverAbajo()
		}
	}
}

object triggerArbol1{
	var property position = game.at(20, 8)
	var property image = "mica.png"
	var property nombre = "arbol"

	method msg(){
		var texto = "Necesito un hacha para cortar el arbol."

		if (zarek.tieneEspada()){
			texto = "Corta el arbol ! ! !"
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object triggerArbol2{
	var property position = game.at(19, 9)
	var property image = "mica.png"
	var property nombre = "arbol"

	method msg(){
		var texto = "Necesito un hacha para cortar el arbol."

		if (zarek.tieneEspada()){
			texto = "Corta el arbol ! ! !"
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

class Arbol{
	var property position
	var property image = "arbol.png"
}

class Rio{
	var property position
	var property image
}