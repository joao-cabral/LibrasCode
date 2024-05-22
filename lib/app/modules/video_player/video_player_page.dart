import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librascode/app/modules/core/factories/dialog/dialog_actions.dart';
import 'package:librascode/app/modules/core/factories/dialog/dialog_factory.dart';
import 'package:librascode/app/modules/video_player/video_player_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerPage extends StatefulWidget {
  final String? videoId;
  final VideoPlayerController controller;
  const VideoPlayerPage({Key? key, this.videoId, required this.controller})
      : super(key: key);
  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    _playerController =
        widget.controller.configYoutubePLayer(widget.videoId ?? 'ZtMzB5CoekE');

    _playerController.stream.firstWhere((data) {
      if (data.metaData.videoId.isNotEmpty) {
        widget.controller.saveVideo(data.metaData);
        return true;
      }
      return false;
    });

    super.initState();
  }

  _showDialog() {
    DialogFactory.showAlertDialog(
        title: const Text('Tem certeza?'),
        content: const Text('O vídeo ainda não finalizou'),
        actions: [
          DialogActions(
            onPressed: () {
              Modular.to.pop();
            },
            child: const Text('NÃO'),
          ),
          DialogActions(
            onPressed: () {
              Modular.to.popUntil(ModalRoute.withName('/'));
            },
            child: const Text('SIM'),
          ),
        ]);
  }

  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tem certeza?'),
          content: const Text(
            'Você realmente quer sair da página?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Continuar',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Sair',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Modular.to.popUntil(ModalRoute.withName('/'));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _playerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
        body: YoutubePlayerScaffold(
          backgroundColor: Colors.white,
          aspectRatio: 16 / 9,
          controller: _playerController,
          builder: (context, player) {
            //função que inicia o video no fullScreen
            // _playerController.enterFullScreen();
            _playerController.listen((event) => event.fullScreenOption);
            return Column(
              children: [
                player,
                StreamBuilder(
                  stream: _playerController.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text('Carregando...');
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data?.metaData.title ?? 'N/A',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: const TextStyle(fontSize: 18),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
