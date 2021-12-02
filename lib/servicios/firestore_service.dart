import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo2/modelos/equipo.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  //declaración de instancia de fiestore
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //insertar o actualizar un Equipo
  Future saveEquipo(Equipo equipo){
    return _db
          .collection('equipos')
          .doc(equipo.equipoId)
          .set(equipo.toMap());
  }

  //Obtener snashot de DB
  Stream<List<Equipo>> getEquipos() {
    return _db.collection('equipos').snapshots().map((snapshot) => snapshot.docs.map((document) => Equipo.fromFirestore(document.data())).toList());
  }

  //delete Equipo
  Future deleteEquipo(String equipoId) {
    return _db.collection('equipos').doc(equipoId).delete();
  }
}