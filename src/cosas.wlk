object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantBultos() {return 1}
	method serCargada() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method cantBultos() {return 2}
	method serCargada() {transformadoEnAuto = false}
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
	method cantBultos() {return if (cantLadrillos < 101) {1} else if (100 < cantLadrillos < 301) {2} else {3}}
	method serCargada() {if (cantLadrillos < 12) {cantLadrillos = 0} else {cantLadrillos -= 12}}
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
	method cantBultos() {return 1}
	method serCargada() {if (peso < 15) {peso = 0} else {peso -= 15}}
}

object bateriaAntiaerea {
	var tieneMisiles = false
	method peso() {return if (tieneMisiles) {300} else {200}}
	method nivelPeligrosidad() {
		return if (tieneMisiles) {100} else {0}
	}
	method cantBultos() {return if (tieneMisiles) {2} else {1}}
	method serCargada() {tieneMisiles = true}
}

object contenedorPortuario {
	const property cosasGuardadas = []

	method peso() {return 100 + cosasGuardadas.sum {cosa => cosa.peso()}}
	method nivelPeligrosidad() {return if (cosasGuardadas.isEmpty()) {0} else {self.laMasPeligrosa().nivelPeligrosidad()}}
	method guardarAlgo(unaCosa) {
		return cosasGuardadas.add(unaCosa)
	}
	method laMasPeligrosa() {return cosasGuardadas.max {cosa => cosa.nivelPeligrosidad()}}
	method cantBultos() {return 1 + cosasGuardadas.sum{cosa => cosa.cantBultos()}}
	method serCargada() {cosasGuardadas.forEach{cosa => cosa.serCargada()}}
}

object residuosRadioactivos {
	var peso = 20
	method peso() {return peso}
	method nivelPeligrosidad() {return 200}
	method cantBultos() {return 1}
	method serCargada() {peso += 15}
}

object embalajeSeguridad {
	var objetoQueEnvuelve = bateriaAntiaerea

	method peso() {objetoQueEnvuelve.peso()}
	method nivelPeligrosidad() {return objetoQueEnvuelve.nivelPeligrosidad() / 2}
	method cantBultos() {return 2}
	method serCargada() {}
}