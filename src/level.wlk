import wollok.game.*
import mapa.*
import elementos.*
import interfaz.*
import zarek.*

object pantallaInicial{
    var property image = "inicioGame.png"
    var property position = game.at(0, 0)

    method init(){
        game.addVisual(self)
        //mapping.dibujar(estructuraInicio.estructura())
        keyboard.enter().onPressDo({game.clear(); nivelDificil.init()})
		keyboard.space().onPressDo({game.clear(); nivelDificil.init()})
    }
}

class Nivel{
    method init(){
        game.addVisual(self)

        game.addVisual(corazon)
        game.addVisual(ogro)
        game.addVisual(principe)
        game.addVisual(espada)
        game.addVisual(duende)
        game.addVisual(llave)
        game.addVisual(puerta)
		game.addVisual(hacha)
		game.addVisual(arbolCaido)

        game.addVisual(triggerOgro)
        game.addVisual(triggerPuerta)
		game.addVisual(triggerDuende)
		game.addVisual(triggerArbol1)
		game.addVisual(triggerArbol2)
		game.addVisual(rioCollide)
        game.addVisual(triggerPrincipe1)
        game.addVisual(triggerPrincipe2)

        game.addVisual(timer)
        game.addVisual(reloj)
	    reloj.iniciar()

		isla.init()

        game.addVisual(zarek)
        controlDeColisiones.init()

      	keyConfig.init()
    }
}

object nivelFacil inherits Nivel (){
    override method init(){
        super()
        game.boardGround("backgroundNivel.png")
        mapping.dibujar(estructuraDificil.estructura())
    }
}

object nivelDificil inherits Nivel(){
    var property image = "backgroundNivel.png"
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
        game.clear()
        game.addVisual(self)
        //  Enter para reiniciar
        keyboard.space().onPressDo({game.clear(); nivelDificil.init()})
        keyboard.enter().onPressDo({game.clear(); nivelDificil.init()})
    }
}

object gameEnd {
    var property image = "final.png"
    var property position = game.at(0, 0)

    method init(){
        //game.clear()
        game.addVisual(self)
        keyboard.enter().onPressDo({game.stop()})
        keyboard.space().onPressDo({game.stop()})
    }
}