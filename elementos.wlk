class Hogar{
  var mugre
  const confort
  method esBueno()= confort >= mugre/2
  method efectoAtaqueDe(unaPlaga) {
    mugre+= unaPlaga.daño()
  }


}

class Huerta {
  var produccion
  method esBueno() = produccion > nivelMinimoProduccion.valor()
  method efectoAtaqueDe(unaPlaga) {//instancia
    produccion = 0.max((produccion - (unaPlaga.daño()*0.1 + if(unaPlaga.transmiteEnfermedades())10 else 0)))
  }

}

object nivelMinimoProduccion {
  var property valor = 100
}

class Mascota {
  var salud
  method esBueno() = salud > 250
  method efectoAtaqueDe(unaPlaga){
    if(unaPlaga.transmiteEnfermedades()){
      salud = (salud - unaPlaga.daño()).max(0)
    }
  
  
  method efectoAtaqueDe2(unaPlaga){
    salud = (salud -if(unaPlaga.transmiteEnfermedades()) unaPlaga.daño() else 0).max(0)
  }
}

class Barrio {
  const elementos = []
  method esBueno(unElemento) = unElemento.esBueno()
  method esCopado()= self.cantElementosBuenos()>self.cantElementosMalos()
  method cantElementosBuenos()=elementos.count({e=>e.esBueno()})
  method cantElementosMalos()=elementos.count({e=>!e.esBueno()}) // elementos.size()-self.cantElementosBuenos() tambien sirve
}
