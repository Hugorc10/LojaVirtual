import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:loja_virtual/counter.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';
import 'package:loja_virtual/widget_central.dart';
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

  // FirebaseFirestore.instance.collection('estudante').add({'estudante': 'estudante'});

  // FirebaseFirestore.instance.collection('pedidos').add(
  //   {'preco': 199.99, 'usuario': 'Daniel'}
  // );

  // FirebaseFirestore.instance.collection('pedidos').doc('#00001').set(
  //   {'preco': 199.99, 'usuario': 'Daniel Ciolfi'}
  // );

  // FirebaseFirestore.instance.collection('pedidos').doc('#00001').update(
  //     {'usuario': 'Daniel Ciolfi Vinho'}
  // );

  // FirebaseFirestore.instance.collection('pedidos').doc('#00001').collection('nome').doc();

  // Future<DocumentSnapshot> snapshot = await FirebaseFirestore.instance.collection('usuario').doc('jVmUk2PUilLBdLZH2i8h').get();

  // DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //     .collection('usuarios').doc('jVmUk2PUilLBdLZH2i8h').get();
      
      // FirebaseFirestore.instance.collection('usuarios')
      //     .doc('jVmUk2PUilLBdLZH2i8h').snapshots().listen((event) {
      //     print(event.data());
      // });

  // print(snapshot.data());
  // print(snapshot.get('nome'));
  
  // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('boletos').get();
  // FirebaseFirestore.instance.collection('boletos').snapshots().listen((snapshot) {
  //   for(DocumentSnapshot document in snapshot.docs) {
  //     print(document.data());
  //   }
  // });
  // for(DocumentSnapshot document in snapshot.docs) {
  //   print(document.data());
  // }
  // print(snapshot.docs);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Loja Virutal',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          appBarTheme: const AppBarTheme(
            elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BaseScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  MyHomePage(this.title);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: WidgetCentral(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<Counter>().increment();
        },
        tooltip: 'Incriment',
        child: Icon(Icons.add),
      ),
    );
  }
}
