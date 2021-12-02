import 'package:equipo2/modelos/equipo.dart';
import 'package:equipo2/providers/equipo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditEquipo extends StatefulWidget {
  final Equipo? equipo;
  const EditEquipo([this.equipo]);

  @override
  _EditEquipoState createState() => _EditEquipoState();
}

class _EditEquipoState extends State<EditEquipo> {
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final nserieController = TextEditingController();
  final aliasController = TextEditingController();
  final asignadoController = TextEditingController();
  final cantidadController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    marcaController.dispose();
    modeloController.dispose();
    nserieController.dispose();
    aliasController.dispose();
    asignadoController.dispose();
    cantidadController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.equipo == null) {
      //Equipo Nuevo
      marcaController.text = "";
      modeloController.text = "";
      nserieController.text = "";
      aliasController.text = "";
      asignadoController.text = "";
      cantidadController.text = "";
      Future.delayed(Duration.zero, () {
        final equipoProvider = Provider.of<EquipoProvider>(this.context,
            listen: false); //add this en context
        equipoProvider.loadValues(Equipo());
      });
    } else {
      //update or delete equipo
      marcaController.text = widget.equipo!.marca.toString();
      modeloController.text = widget.equipo!.modelo.toString();
      nserieController.text = widget.equipo!.nserie.toString();
      aliasController.text = widget.equipo!.alias.toString();
      asignadoController.text = widget.equipo!.asignado.toString();
      cantidadController.text = widget.equipo!.cantidad.toString();
      Future.delayed(Duration.zero, () {
        final equipoProvider = Provider.of<EquipoProvider>(this.context,
            listen: false); //add this en context
        equipoProvider.loadValues(widget.equipo);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Equipo'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: marcaController,
              decoration: InputDecoration(hintText: 'Marca'),
              onChanged: (value) {
                equipoProvider.setMarca(value);
              },
            ),
            TextField(
              controller: modeloController,
              decoration: InputDecoration(hintText: 'Modelo del equipo'),
              onChanged: (value) {
                equipoProvider.setModelo(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: nserieController,
              decoration: InputDecoration(hintText: 'No. Serie del equipo'),
              onChanged: (value) {
                equipoProvider.setNserie(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: aliasController,
              decoration: InputDecoration(hintText: 'Alias'),
              onChanged: (value) {
                equipoProvider.setAlias(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: cantidadController,
              decoration: InputDecoration(hintText: 'Cantidad'),
              onChanged: (value) {
                equipoProvider.setCantidad(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: asignadoController,
              decoration: InputDecoration(hintText: 'Responsable'),
              onChanged: (value) {
                equipoProvider.setAsignado(value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: () {
                equipoProvider.saveEquipo();
                Navigator.of(context).pop();
                _mostrarAlerta(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10))),
            ),
            (widget.equipo != null)
                ? ElevatedButton(
                    child: Text('Eliminar'),
                    onPressed: () {
                      equipoProvider.deleteEquipo(widget.equipo!.equipoId);
                      Navigator.of(context).pop();
                      _mostrarAlerta2(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Guardar o Actualizar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Se guardo la información'),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _mostrarAlerta2(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Eliminar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('El elemento se eliminó'),
                FlutterLogo(size: 100.0),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
