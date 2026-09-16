import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		self.validarQueSePuedeCargar(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarExistencia(unaCosa)
		cosas.remove(unaCosa)
		
	}

	method carga() {return cosas}

	method pesoTotal() {
		return 1000 + cosas.sum {cosa => cosa.peso()}
	}

	method pesoDisponible() {
		return 2500 - self.pesoTotal()
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosPeligrosos(nivel) {
		return cosas.filter {cosa => cosa.nivelPeligrosidad() > nivel}
	}

	method objetosMasPeligrososQue(unaCosa) {
		return cosas.filter {cosa => cosa.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()}
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.all {cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad}
	}

	method validarQueSePuedeCargar(unaCosa) {
		return if (self.pesoDisponible() < unaCosa.peso()) self.error("se supero el maximo de peso para este camion")
	}

	method validarExistencia(unaCosa) {
		return if (not cosas.contains(unaCosa)) self.error("no existe ese objeto en el camion")
	}

}


