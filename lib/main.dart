// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange Currency Computer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Exchange Computer Sprint 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final TextoOrigen =
    TextEditingController(); // se generan variables para poder manipular los datos ingresados por el usuario en el teclado
final TextoDestino = TextEditingController();

class Computer {
  // los atributos se crean de tipo final para que pueda recibir cualquier tipo de dato
  final titulo;
  final color;
  final icon;

  Computer(this.titulo, this.color, this.icon);
}

List<DropdownMenuItem<String>> desplegar_monedas = <DropdownMenuItem<String>>[
  //se instancia el objeto "desplegar_monedas" de la clase DropdownMenuItem
  DropdownMenuItem(
    // se genera cada item y se le asocian los atributos de la clase DropdownMenuItem,Value  Child
    value: "USD",
    child: Text("USD"),
  ),
  DropdownMenuItem(
    value: "EUR",
    child: Text("EUR"),
  ),
  DropdownMenuItem(
    value: "COP",
    child: Text("COP"),
  )
];

String Option1 =
    "COP"; // se crean las variables de tipo de moneda a fin de controlar desde el Dropdown button el item seleccionado, de la misma forma que con las Card
String Option2 = "USD";
List<Computer> cal = <Computer>[
  // instanciar la variable cal para que se genere de la clase "Computer" y reciba los atributos de esta clase
  Computer("9", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("8", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("7", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("6", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("5", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("4", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("3", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("2", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("1", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("0", Color.fromARGB(255, 82, 255, 114), Icon(Icons.abc)),
  Computer("Limpiar", Color.fromARGB(255, 82, 255, 114),
      Icon(Icons.cleaning_services_outlined)),
  Computer("Calcular", Color.fromARGB(255, 82, 255, 114),
      Icon(Icons.calculate_outlined)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(// separa los Card Iterados
              children: [
            Row(
              children: [
                Text("Moneda Origen: "),
                DropdownButton(
                    value:
                        Option1, //  por defecto se selecciona la cadena "COP" como el string que muestra
                    items:
                        desplegar_monedas, // se llama a la lista de monedas creada e instanciada
                    onChanged:
                        (String? // se genera la variable X la cual regresa el objeto selecccionado por el usuario
                            X) {
                      setState(() {
                        Option1 = X.toString();
                      });
                    }), // se crea la lista desplegada de acuerdo a los items definidos en la clase de listas desplegables de arriba
                Text("Moneda Origen: "),
                DropdownButton(
                    value: Option2,
                    items: desplegar_monedas,
                    onChanged: (String? Y) {
                      setState(() {
                        Option2 = Y.toString();
                      });
                    })
              ],
            ),
            TextField(
              controller: TextoOrigen,
              decoration: InputDecoration(
                  labelText: "Valor Moneda Origen", hintText: "0"),
            ),
            TextField(
              controller:
                  TextoDestino, // se genera el atributo en TextField para manipular y controlar la informacion indicada por el usuario
              decoration: InputDecoration(
                  labelText: "Valor Moneda Convertida", hintText: "0"),
            ),
            Expanded(
                // se genera un widget Expanded para que el Column no se exceda de los limites de la pantalla
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3), // Cuantas columnas vaa generar
                    itemCount:
                        cal.length, // cuantas veces se realiza la iteracion
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          color: cal[index]
                              .color, // cada objeto Card se genera con el color determinado en la variable cal
                          // genera el objeto de tipo Card iterado generando tantos Cards como objetos en la variable cal
                          child: Center(
                              // centra verticalmente
                              child: ListTile(
                            onTap: () {
                              if (index < 10) {
                                TextoOrigen.text =
                                    TextoOrigen.text + cal[index].titulo;
                              } else if (index == 10) {
                                TextoOrigen.text = " ";
                                TextoDestino.text = " ";
                              } else {
                                if (Option1 == "COP" && Option2 == "USD") {
                                  TextoDestino.text =
                                      (double.parse(TextoOrigen.text) * 5000)
                                          .toString();
                                } else if (Option1 == "COP" &&
                                    Option2 == "EUR") {
                                  TextoDestino.text =
                                      (double.parse(TextoOrigen.text) * 4955.67)
                                          .toString();
                                } else if ((Option1 == "COP" &&
                                        Option2 == "COP") ||
                                    (Option1 == "EUR" && Option2 == "EUR") ||
                                    (Option1 == "USD" && Option2 == "USD")) {
                                  TextoDestino.text = TextoOrigen.text;
                                } else if (Option1 == "USD" &&
                                    Option2 == "COP") {
                                  TextoDestino.text =
                                      (double.parse(TextoOrigen.text) *
                                              (1 / 5000))
                                          .toString();
                                } else if (Option1 == "USD" &&
                                    Option2 == "EUR") {
                                  TextoDestino.text =
                                      (double.parse(TextoOrigen.text) *
                                              (5000 / 4955.67))
                                          .toString();
                                } else if (Option1 == "EUR" &&
                                    Option2 == "COP") {
                                  TextoDestino.text =
                                      (double.parse(TextoOrigen.text) *
                                              (1 / 4955.67))
                                          .toString();
                                } else if (Option1 == "EUR" &&
                                    Option2 == "USD") {
                                  TextoDestino.text =
                                      (double.parse(TextoOrigen.text) *
                                              (4955.67 / 5000))
                                          .toString();
                                }
                              }
                            },
                            title: Center(
                              // centra horizontalmente
                              child: index > 9
                                  ? cal[index].icon
                                  : Text(cal[index].titulo),
                            ),
                          )));
                    }
                    // This trailing comma makes auto-formatting nicer for build methods.
                    ))
          ]),
        ));
  }
}
