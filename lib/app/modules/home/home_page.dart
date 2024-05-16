import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // final sqliteConnection = Modular.get<SqliteConnectionFactory>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'LibrasCode',
          style: GoogleFonts.robotoCondensed(
            textStyle: const TextStyle(fontSize: 24),
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constrains.maxHeight, minWidth: constrains.maxWidth),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      color: Colors.grey,
                      width: screenWidth * 0.6,
                      height: screenHeight * 0.3,
                      child: const Icon(
                        Icons.qr_code_rounded,
                        size: 68,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenHeight * 0.3,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          side: const BorderSide(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      onPressed: () => Modular.to.pushNamed(
                        '/qr-code/',
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Scan QRCode',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recentes:'),
                      TextButton(
                          onPressed: () => Modular.to.pushNamed('/historic/'),
                          child: const Text(
                            'Todos',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) => Card(
                            child: ListTile(
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                              leading: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  child: Text(index.toString())),
                              title: const Text('Titulo do video'),
                              subtitle: const Text('Author'),
                              trailing: const Text('15 de mai, 2024'),
                            ),
                          ))
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
