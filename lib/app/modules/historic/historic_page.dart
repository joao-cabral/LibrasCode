import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:librascode/app/modules/historic/historic_controller.dart';

class HistoricPage extends StatefulWidget {
  final HistoricController controller;
  const HistoricPage({super.key, required this.controller});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  DateFormat dateFormat = DateFormat('dd MMMM, yyyy', 'pt_BR');

  @override
  void initState() {
    widget.controller.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: const Text(
            'Histórico',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Observer(builder: (_) {
          if (widget.controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (widget.controller.historic.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: widget.controller.historic.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: ListTile(
                    onTap: () => Modular.to.pushNamed(
                      '/video-player/?videoId=${widget.controller.historic[index].videoId}',
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child:
                            Text(widget.controller.historic[index].author[0])),
                    title: Text(widget.controller.historic[index].title),
                    subtitle: Text(
                        '${widget.controller.historic[index].author}\n${dateFormat.format(widget.controller.historic[index].watchDate)}'),
                  ),
                ),
              ),
            );
          }

          return const Center(
            child: Text('Sem histórico'),
          );
        }));
  }
}
