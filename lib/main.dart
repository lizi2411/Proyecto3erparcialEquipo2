import 'package:equipo2/paginas/home_p.dart';
import 'package:equipo2/providers/equipo_provider.dart';
import 'package:equipo2/servicios/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EquipoProvider()),
        StreamProvider(
            create: (context) => firestoreService.getEquipos(),
            initialData: null)
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productos',
          home: HomeP(),
        );
      }),
    );
  }
}
