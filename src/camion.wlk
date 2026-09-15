import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
		
	}

	method pesoTotal() {}

	method excedidoDePeso() {}

	method objetosPeligrosos(nivel) {}

	method objetosMasPeligrososQue(unaCosa) {}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {}

}


