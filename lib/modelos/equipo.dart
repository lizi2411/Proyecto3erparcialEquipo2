class Equipo {
  String? equipoId;
  String? marca;
  String? modelo;
  String? nserie;
  String? alias;
  String? asignado;
  String? cantidad;

  //Constructor
  Equipo(
      {this.equipoId,
      this.marca,
      this.modelo,
      this.nserie,
      this.alias,
      this.asignado,
      this.cantidad});

  //Objeto a Map
  Map<String, dynamic> toMap() {
    return {
      'equipoId': equipoId,
      'marca': marca,
      'modelo': modelo,
      'nserie': nserie,
      'alias': alias,
      'asignado': asignado,
      'cantidad': cantidad
    };
  }

  //constructor que convierta de Firestore a un objeto Equipo
  Equipo.fromFirestore(Map<String, dynamic> firestore)
      : equipoId = firestore['equipoId'],
        marca = firestore['marca'],
        modelo = firestore['modelo'],
        nserie = firestore['nserie'],
        alias = firestore['alias'],
        asignado = firestore['asignado'],
        cantidad = firestore['cantidad'];
}
