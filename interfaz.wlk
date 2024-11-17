object timer{
    var property position = game.at(0, 11)
    var property image = "reloj.png"
}

object paleta {
  const property verde = "00FF00FF"
  const property rojo = "FF0000FF"
}


object reloj {
	
	var tiempo = 60
	
	method text() = tiempo.toString()
    method textColor() = paleta.verde()
    method textSize() = 10
	method position() = game.at(0, game.height()-1)
	
	method pasarTiempo() {
		tiempo = 0.max(tiempo - 1) 
        self.detenerEn(0)
	}
	method iniciar(){
		tiempo = 60
		game.onTick(2000,"tiempo", {self.pasarTiempo()})
        
	}
	method detenerEn(cantidad){
        if( cantidad == tiempo)
		    game.removeTickEvent("tiempo")
        
	}

    method perderJuegoPorReloj(){
        if(tiempo == 0){
            gameOver.sinTiempo()
        }
    }
}

object gameOver{


    method sinTiempo() = 0

}
