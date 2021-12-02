import 'package:equipo2/modelos/equipo.dart';
import 'package:equipo2/paginas/edit_equipo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeP extends StatelessWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equipos = Provider.of<List<Equipo>?>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Equipos en inventario'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditEquipo()));
              },
            ),
          ],
        ),
        body: (equipos != null)
            ? ListView.builder(
                itemCount: equipos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.assignment_outlined),
                    title: Text(equipos[index].marca.toString()),
                    trailing: Text(equipos[index].alias.toString()),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditEquipo(equipos[index])));
                    },
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
