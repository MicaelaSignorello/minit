import wollok.game.*
import personajes.*
import paredes.*
class Piedra {
    method image() = "piedra.png"
    var property position = game.at(2, 6)
}

object paredes{
    interno.Piedra().forEach( { p=>game.addVisual(new Duro(position=p)); })


}

// Agregado 15/11/2024
	object estructuraMapa1{
		var property estructura = [0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                      
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1,
			                       
			                       0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1, 
			                       
			                       1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 0] // -> Muralla china.
}



object mapping{
	
	var property mapa_actual = estructuraMapa1.estructura()
	
	method limpiar(){
		game.allVisuals().forEach{visuales =>
			game.removeVisual(visuales)
		}
	}
	
	method dibujar(){
		
        var x = 0
        var y = 13
        	
            mapa_actual.forEach{ rastreador =>
               
                if (x == 16){
                    x = 0
                    y -= 1
                    }
                    
                //Pared (Opera, y está bien):
                if(rastreador == 1){
                    const pared = new TipoPared(position = game.at(x, y), nombre = "pared", dano = 0, image = "pared.png")
                    game.addVisual(pared)
                    	
                
                }
                         
       			x += 1
        	}
        	
        }
        
     
	}