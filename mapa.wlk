
class Piedra {
    method image() = "piedra.png"
    var property position = game.at(2, 6)
}

object paredes(){
    interno.Piedra().forEach( { p=>game.addVisual(new Duro(position=p)); })


}