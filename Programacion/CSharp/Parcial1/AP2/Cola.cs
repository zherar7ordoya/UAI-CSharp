﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AP2 {
  class Cola {
    Nodo _inicio;

    public Nodo Inicio { get { return _inicio; } }

    public void Encolar(Nodo unNodo) {
      if (_inicio == null) { _inicio = unNodo; }
      else {
        Nodo auxiliar = BuscarUltimo(_inicio);
        auxiliar.Siguiente = unNodo;
      }
    }

    public void Desencolar() { _inicio = _inicio.Siguiente; }

    public Nodo BuscarUltimo(Nodo unNodo) {
      if (unNodo.Siguiente == null) { return unNodo; }
      else { return BuscarUltimo(unNodo.Siguiente); }
    }

    public bool Vacia() { return (_inicio == null); }
  }
}
