import wollok.game.*
import mapa.*
import personajes.*
import interfaz.*

object pantallaInicial{
    var property image = "inicio.png"
    var property position = game.at(0, 0)

    method init(){
        game.addVisual(self)
        mapping.dibujar(estructuraInicio.estructura())
        keyboard.enter().onPressDo({game.clear(); nivelDificil.init()})
    }
}

class Nivel{
    method init(){
        game.addVisual(self)

        game.addVisual(arbolPrueba)
        game.addVisual(corazon)
        game.addVisual(ogro)
        game.addVisual(principe)
        game.addVisual(espada)
        game.addVisual(duende)
        game.addVisual(llave)
        game.addVisual(puerta)

        game.addVisual(triggerOgro)
        game.addVisual(triggerPuerta)
        
        game.addVisual(timer)
        game.addVisual(reloj)
	    reloj.iniciar()

        game.addVisual(zarek)
        controlDeColisiones.init()

      	keyConfig.init()
    }
}

object nivelFacil inherits Nivel (){
    override method init(){
        super()
        game.boardGround("nivelFacil.png")
        mapping.dibujar(estructuraDificil.estructura())
    }
}

object nivelDificil inherits Nivel(){
    var property image = "nivelDificil.png"
    var property position = game.at(0, 0)

    override method init(){
        super()
        mapping.dibujar(estructuraDificil.estructura())

    }
}

object gameOver {
    var property image = "gameOver.png"
    var property position = game.at(0, 0)

    method init(){
        //  IF dificultad
        game.clear()
        game.addVisual(self)
        //  Enter para reiniciar
        keyboard.enter().onPressDo({game.clear(); nivelDificil.init()})
        keyboard.space().onPressDo({game.stop()})
    }
}

object gameEnd {
    var property image = "gameEnd.png"
    var property position = game.at(0, 0)

    method init(){
        game.clear()
        game.addVisual(self)
        keyboard.enter().onPressDo({game.stop()})
        keyboard.esc().onPressDo({game.stop()})
    }
}