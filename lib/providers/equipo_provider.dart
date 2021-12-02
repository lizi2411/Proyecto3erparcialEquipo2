import 'package:equipo2/modelos/equipo.dart';
import 'package:equipo2/servicios/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class EquipoProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  String? _equipoId;
  String? _marca;
  String? _modelo;
  String? _nserie;
  String? _alias;
  String? _asignado;
  String? _cantidad;
  var uuid = Uuid();

  //gtters
  String? get marca => _marca;
  String? get modelo => _modelo;
  String? get nserie => _nserie;
  String? get alias => _alias;
  String? get asignado => _asignado;
  String? get cantidad => _cantidad;

  //setters
  setMarca(String marca) {
    _marca = marca;
    notifyListeners();
  }

  setModelo(String modelo) {
    _modelo = modelo;
    notifyListeners();
  }

  setNserie(String nserie) {
    _nserie = nserie;
    notifyListeners();
  }

  setAlias(String alias) {
    _alias = alias;
    notifyListeners();
  }

  setAsignado(String asignado) {
    _asignado = asignado;
    notifyListeners();
  }

  setCantidad(String cantidad) {
    _cantidad = cantidad;
    notifyListeners();
  }

  //asignación de los valores al provider
  //solo se escuda con el primer valor que se carga
  //no es necesario colocar "!" a los demas strings
  //ya que solo es al primer valor que se carga
  loadValues(Equipo? equipo) {
    _marca = equipo!.marca;
    _modelo = equipo.modelo;
    _nserie = equipo.nserie;
    _alias = equipo.alias;
    _asignado = equipo.asignado;
    _cantidad = equipo.cantidad;
    _equipoId = equipo.equipoId;
  }

  //save equipo
  saveEquipo() {
    if (_equipoId == null) {
      var newEquipo = Equipo(
          equipoId: uuid.v4(),
          marca: _marca,
          modelo: _modelo,
          nserie: _nserie,
          alias: _alias,
          asignado: _asignado,
          cantidad: _cantidad);
      firestoreService.saveEquipo(newEquipo);
    } else {
      var existingEquipo = Equipo(
          equipoId: _equipoId,
          marca: _marca,
          modelo: _modelo,
          nserie: _nserie,
          alias: _alias,
          asignado: _asignado,
          cantidad: _cantidad);

      firestoreService.saveEquipo(existingEquipo);
    }
  }

  //delete equipo
  deleteEquipo(String? equipoId) {
    firestoreService.deleteEquipo(equipoId!);
  }
}
