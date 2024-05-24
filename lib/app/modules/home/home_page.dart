import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:librascode/app/modules/home/component/qrcode_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DateFormat dateFormat = DateFormat('dd MMMM, yyyy', 'pt_BR');

  @override
  void initState() {
    widget.controller.getAll();
    widget.controller.historic.addListener(() {
      setState(() {});
    });
    widget.controller.loading.addListener(() {
      setState(() {});
    });
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constrains) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: constrains.maxWidth,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  QRCodeComponent(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    controller: widget.controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recentes:'),
                      TextButton(
                          onPressed: () => Modular.to
                              .pushNamed('/historic/')
                              .then((value) => widget.controller.getAll()),
                          child: const Text(
                            'Todos',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  if (widget.controller.loading.value)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (widget.controller.historic.value.isNotEmpty)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.controller.historic.value.length < 5
                          ? widget.controller.historic.value.length
                          : 5,
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: ListTile(
                          onTap: () => Modular.to.pushNamed(
                            '/video-player/?videoId=${widget.controller.historic.value[index].videoId}',
                          ),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          leading: CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Text(widget
                                  .controller.historic.value[index].author[0])),
                          title: Text(
                              widget.controller.historic.value[index].title),
                          subtitle: Text(
                              '${widget.controller.historic.value[index].author}\n${dateFormat.format(widget.controller.historic.value[index].watchDate)}'),
                        ),
                      ),
                    ),
                  if (widget.controller.historic.value.isEmpty)
                    const Center(
                      child: Text('Sem histórico'),
                    )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
