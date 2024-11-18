import wollok.game.*
import personajes.*
import paredes.*

// 1 piedra , 2 tronco(arbol) 5 corazon,
// 100  puerta 99 puerta abierta, 98 ogro, 97 corazon
// Agregado 15/11/2024


	object estructuraMapa1{
		var property estructura = [
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
			    
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                          
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                          
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
		]
}
/* 1 maca es una princesa que quiere rescatar a su principe atrapado por un 
ogro(el principe no pude puede combatirlo porque le da ansiedad el color verde ) 
para eso debe hallar la llave de la armeria donde se encuentra la espada.
lamentablemente la llave se encuentra en una isla rodeada de agua. para alcanzarla 
debera derribar el arbol cercano al rio y usarlo como puente.
 
*/

object mapping{
	
	var property mapa_actual = estructuraMapa1.estructura()
	
	method limpiar(){
		game.allVisuals().forEach{visuales =>
			game.removeVisual(visuales)
		}
	}
	
	method dibujar(){
		
        var x = 0
        var y = 11
        	
        mapa_actual.forEach{ rastreador =>
           
            if (x == 25){
                x = 0
                y -= 1
                }
                
            //Pared (Opera, y está bien):
            if(rastreador == 1){
                const pared = new TipoPared(position = game.at(x, y), nombre = "pared", dano = 0, image = "pedruzco.png")
                game.addVisual(pared)
            } else if (rastreador == 2){
				const arbol = new Arbol(position = game.at(x, y), nombre = "arbol", dano = 0, image = "arbol.png")
			} // Ver si hace falta pasarle imagen y nombre.
       		x += 1
        }
    }
}

object corazon {
    var property position = game.at(8, 6)
    var property image = "corazon.png"
	var property nombre = "corazon"

	method remover(){
		game.removeVisual(self)
	}
}

object espada {
	var property position = game.at(10, 10)
	var property image = "espada.png"
	var property nombre = "espada"

	method remover(){
		game.removeVisual(self)
	}
}

class Arbol{
	var property position
	var property image = "arbol.png"
	var property nombre = "arbol"
}

class Rio{
	var property position
	var property orientacion = "NS"
	var property image = "rio.png"
	var property nombre = "rio"
}

object prision {
	var property position = game.at(4, 4)
	var property image = "prision.png"
	var property nombre "pision"
}

//	Se puede hacer clase "elementosDelMapa" y usar como interfaz.
//	Para: Corazon, prision, espada, rio, piedra, arbol

//	Pasar a archivo "paredes.wlk", renombrar a "elementos".
