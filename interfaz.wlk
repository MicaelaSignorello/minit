object timer{
    var property position = game.at(0, 11)
    var property image = "reloj.png"
}

object reloj{
    var property position = game.at(0, 11)
    // var property image = "numEjemplo.png"
    var property textoReloj = 60
    var text = "60"

    method text() = text

    method restarSegundos(cantidad){
        textoReloj = 0.max(textoReloj - 1)
        text = textoReloj.toString()
        
    }


    method segundo(){}
}

 