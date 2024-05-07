import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librascode/app/core/factories/dialog/dialog_actions.dart';
import 'package:librascode/app/core/factories/dialog/dialog_factory.dart';
import 'package:librascode/app/modules/video_player/video_player_controller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerPage extends StatefulWidget {
  final String? videoId;
  const VideoPlayerPage({Key? key, this.videoId}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _playerController;
  final controller = VideoPlayerController();

  @override
  void initState() {
    _playerController =
        controller.configYoutubePLayer(widget.videoId ?? 'ZtMzB5CoekE');
    super.initState();
  }

  _showDialog() {
    DialogFactory.showAlertDialog(
        title: const Text('Tem certeza?'),
        content: const Text('O vídeo ainda não finalizou'),
        actions: [
          DialogActions(
            onPressed: () {
              // controller.popScope(false);
              Modular.to.pop();
            },
            child: const Text('NÃO'),
          ),
          DialogActions(
            onPressed: () {
              // controller.popScope(true);
              Modular.to.pop();
            },
            child: const Text('SIM'),
          ),
        ]);
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
      canPop: true,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        _showDialog();
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
