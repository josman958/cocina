class User {
  String? nombre;
  int? tipoActual;
  int? etapaActual;

  User() {
    this.nombre = 'jos';
    this.tipoActual = 1;
    this.etapaActual = 1;
  }

  actualizarEtapa() {
    this.etapaActual++;
    print(this.etapaActual);
  }
}
