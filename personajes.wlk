import wollok.game.*

object zarek {

    method image() = "mica.png"
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


object piedra {
    method image() = "piedra.png"
    var property position = game.at(2, 6)
}
