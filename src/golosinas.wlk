/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
class Bombon {
	var peso = 15
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() { return frutilla }
	method libreGluten() { return true }
}

class BombonDuro inherits Bombon {
	
	override method mordisco() {0.max(peso - 1)}
	method gradoDeDureza() = if(peso > 12) 3 else if (peso >= 8) 2 else 1
}

/*var bombon = new Bombon() 
bombon.mordisco()
 El método está en la clase Bombón. El método lookup recorre esta clase y encuentra la definición del método.
bombon.peso()
 El método está en la clase Bombón. El método lookup recorre esta clase y encuentra la definición del método.
bombon = new BombonDuro() 
bombon.mordisco()
 El método está en la clase Bombón Duro. El método lookup recorre esta clase.  
bombon.peso()
 El método esta en la superclase Bombón. El método lookup recorre la sub clase Bombón duro, no encontrando el método
 peso(), por lo que lo busca en la super clase Bombón, encontrando la definición en esta última.  }
*/

class Alfajor {
	var peso = 15
	
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = peso * 0.8 }
	method sabor() { return chocolate }
	method libreGluten() { return false }
}

class Caramelo {
	var peso = 5
	var sabor = frutilla
	method precio() { return 12 }
	method peso() { return peso }
	method mordisco() { peso = peso - 1 }
	method sabor() { return sabor }
	method libreGluten() { return true }
}

class CarameloConCorazonDeChocolate inherits Caramelo {
	
	override method mordisco() {
		super()
		sabor = chocolate
	}
	
	override method precio() = super() + 1
}

/*var caramelo = new Caramelo() 
caramelo.mordisco() 
* El método está en la clase Caramelo. El método lookup recorre esta clase y encuentra la definición del método.
caramelo.peso()
* El método está en la clase Caramelo. El método lookup recorre esta clase y encuentra la definición del método. 
caramelo.sabor() 
* El método está en la clase Caramelo. El método lookup recorre esta clase y encuentra la definición del método.
caramelo = new CarameloRelleno() 
caramelo.mordisco() 
* El método está en la clase CarameloConCorazonDeChocolate. El método lookup recorre esta clase y encuentra la definición del método, ejecutando
* el super(), que es el método mordisco() de la super clase Caramelo, y luego cambiando el sabor a Chocolate.
caramelo.peso() 
* El método está en la super clase Caramelo. El método lookup recorre la sub clase CarameloConCorazonDeChocolate, no encontrando el método
 peso(), por lo que lo busca en la super clase Caramelo, encontrando la definición en esta última. 
caramelo.sabor() 
* El método está en la super clase Caramelo. El método lookup recorre la sub clase CarameloConCorazonDeChocolate, no encontrando el método
 sabor(), por lo que lo busca en la super clase Caramelo, encontrando la definición en esta última.  
 */


class Chupetin {
	var peso = 7
	
	method precio() { return 2 }
	method peso() { return peso }
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	method sabor() { return naranja }
	method libreGluten() { return true }
}

class Oblea {
	var peso = 250
	
	method precio() { return 5 }
	method peso() { return peso }
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	method sabor() { return vainilla }
	method libreGluten() { return false }
}

class ObleaCrujiente inherits Oblea {
	var mordiscos = 0
	
	override method mordisco() {
		super()
		mordiscos ++
		if(mordiscos <= 3) {
			peso -= 3
		}
	}
	
	method estaDebil() = mordiscos > 3
}

/*var oblea = new Oblea() 
oblea.mordisco() 
* El método está en la clase Oblea. El método lookup recorre esta clase y encuentra la definición del método.
oblea.peso() 
* El método está en la clase Oblea. El método lookup recorre esta clase y encuentra la definición del método.
oblea = new ObleaCrujiente() 
oblea.mordisco() 
* El método está en la clase ObleaCrujiente. El método lookup recorre esta clase y encuentra la definición del método, ejecutando el método
* de la super clase Oblea, y luego ejecutando el código que está en su defición del método.
oblea.peso()  
* El método está en la super clase Oblea. El método lookup recorre la clase y no encontrando la definición del método, por lo que sube a buscarla
* en la super clase Oblea, encontrándola ahí.
*/

class Chocolatin {
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido = 0
	
	method pesoInicial(unPeso) { pesoInicial = unPeso }
	method precio() { return pesoInicial * 0.50 }
	method peso() { return (pesoInicial - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}

class ChocolatinVIP inherits Chocolatin {
	
	override method peso() = super() * (1 + self.humedad())
	method humedad() = heladeraDeMariano.humedad()
}

class ChocolatinPremium inherits ChocolatinVIP {
	
	override method humedad() = super() / 2
}

object heladeraDeMariano {
	var property humedad = 0
}

/*var chocolatin = new Chocolatin() 
chocolatin.peso() 
* El método está en la clase Chocolatin. El método lookup recorre esta clase y encuentra la definición del método.
chocolatin = new ChocolatinVIP() 
chocolatin.peso() 
* El método está en la clase ChocolatinVIP. El método lookup recorre esta clase y encuentra la definición del método, ejecutando el método
* de la super clase Chocolatin, y luego ejecutando el código que está en su defición del método.
chocolatin = new ChocolatinPremium() 
chocolatin.peso() 
* El método está en la clase ChocolatinPremium. El método lookup recorre esta clase y encuentra la definición del método, ejecutando el método
* de la super clase ChocolatinVIP, y luego ejecutando el código que está en su defición del método.
*/

class GolosinaBaniada {
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	method precio() { return golosinaInterior.precio() + 2 }
	method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti {
	var libreDeGluten
	var sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	method precio() { return (if(self.libreGluten()) 7 else 10) }
	method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}










