import wollok.game.*
import personajes.*
import paredes.*
class Piedra {
    method image() = "pedruzco.png"
    var property position = game.at(2, 6)
}

object paredes{
    //interno.Piedra().forEach( { p=>game.addVisual(new Duro(position=p));})
}

// 	 1 piedra , 2 (arbol), 5 corazon, 6 duende, 7 hacha,8 puerta ,9 espada,15 agua, 10 llave, 11, zarek,
//	 12 cartel, 13 ogro,14  principe.     
 
// Agregado 15/11/2024


	object estructuraMapa1{
		var property estructura = [
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
			    
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                          
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 10 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                          
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 14, 0 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,13 , 0 , 0 , 0 , 0 , 0 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 ,
			                           
			0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0
		]
}
/* pre pantalla : encontra la forma de rescatar al principe
 ///SPOILER///
 1 zarek es una princesa que quiere rescatar a su principe atrapado por un 
ogro(el principe no pude puede combatirlo porque le da ansiedad el color verde ) 
para eso debe hallar la llave de la armeria donde se encuentra la espada.
lamentablemente la llave se encuentra en una isla. para alcanzarla 
debera derribar el arbol cercano al rio y usarlo como puente. Para tomar la llave 
debera cruzar rio derribando el abol cercano usando el hacha, que esta en posesion de un duende!
Para que el duende le de el hacha debera contestar una pregunta. 
Logrado todo esto tomara la espada para derrotar al ogro y salvar al principe.
Pero el principe no va estar convencido asi que zarek debera conquistarlo, para eso debera tener
el corazon del principe, que como es ditraido, se lo dejo por algun lugar del bosque. 


Dificil: 
		tiempo -30%
		El corazon, va estar en la jaula de pepita una vez la liberen. 
		La prgunta del duende es mas dificil
		Cuando tacas al ogro con la espada no tiene filo, hay que afilarla en la pirdra de afilar		
		
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
            } 
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