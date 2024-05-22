import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
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
