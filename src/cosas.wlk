object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var cantLadrillos = 0
	method peso() { return cantLadrillos * 2 + self.cantRefuerzos() * 10}
	method nivelPeligrosidad() { return 50 - self.cantRefuerzos()}
	method agregarLadrillos(numLadrillos) {
		self.validarLimiteLadrillos(numLadrillos)
		cantLadrillos += numLadrillos
	}
	method validarLimiteLadrillos(ladrillos) {
		return if (cantLadrillos + ladrillos > 2500) self.error ("se supero la cantidad maxima de ladrillos en este paquete") 
	}
	method cantRefuerzos() {
		return if (cantLadrillos > 1000) {(cantLadrillos / 50).roundUp(0)} else {(cantLadrillos / 100).roundUp(0)} 
	}
}

object arenaAGranel {
	var peso = 10
	method peso() {
		return peso
	}

	method nivelPeligrosidad() {
		return 1
	}

	method nuevoPeso(unPeso) {
		peso = unPeso
	}
}

object bateriaAntiaerea {
	var estaCargada = false
	method peso() {return if (estaCargada) {300} else {200}}
	method nivelPeligrosidad() {
		return if (estaCargada) {100} else {0}
	}
}

object contenedorPortuario {
	const property cosasGuardadas = []

	method peso() {return 100 + cosasGuardadas.sum {cosa => cosa.peso()}}
	method nivelPeligrosidad() {return if (cosasGuardadas.isEmpty()) {0} else {cosasGuardadas.max {cosa => cosa.nivelPeligrosidad()}}}
	method guardarAlgo(unaCosa) {
		return cosasGuardadas.add(unaCosa)
	}

}

object residuosRadioactivos {
	var peso = 20
	method peso() {return peso}
	method nivelPeligrosidad() {return 200}
}

object embalajeSeguridad {
	var objetoQueEnvuelve = bateriaAntiaerea

	method peso() {objetoQueEnvuelve.peso()}
	method nivelPeligrosidad() {return objetoQueEnvuelve.nivelPeligrosidad() / 2}
}