import elementos.*


class Plaga {// superclase
  var poblacion
  method transmiteEnfermedades() = poblacion >= 10
  method efectoDeAtacar(){
    poblacion = poblacion + poblacion*0.1
  }
  method atacar(unElemento) {
    unElemento.efectoAtaqueDe(self)
    self.efectoDeAtacar()
  }
}

class Cucarachas inherits Plaga {
  //var poblacion
  var pesoPromedioBichos
  method daño() = poblacion*0.5
  override method transmiteEnfermedades() = super() && pesoPromedioBichos >= 10
  override method efectoDeAtacar() {
    super()
    pesoPromedioBichos = pesoPromedioBichos + 2
  }
}

class Pulgas inherits Plaga {// hereda los atributos del padre (Plaga)
  //var poblacion
  override method daño() = super() *2
  //method trasmiteEnfermedades() = poblacion >= 10
}

class Garrapatas inherits Pulgas {// hereda los atributos del padre (Pulga)
  //var poblacion
  //method daño() = poblacion*2
 // method trasmiteEnfermedades() = poblacion >= 10
    override method efectoDeAtacar() {
        poblacion = poblacion + poblacion *0.2
  }
}

class Mosquitos inherits Plaga {// hereda los atributos del padre (Plaga)
  //var poblacion
  method daño() = poblacion
  override method transmiteEnfermedades() = super() && (poblacion % 3 == 0)

}

