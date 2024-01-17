import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:librascode/app/core/factories/dialog/dialog_actions.dart';
import 'package:librascode/app/core/factories/dialog/dialog_factory.dart';
import 'package:librascode/app/modules/video_player/video_player_controller.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    _controller.setFullScreenListener((isFullScreen) {
      log('${isFullScreen ? 'Entered' : 'Exited'} FullScreen');
    });

    _controller = YoutubePlayerController.fromVideoId(
      videoId: 'ZtMzB5CoekE',
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    super.initState();
  }

  _showDialog() {
    final controller =
        Provider.of<VideoPlayerController>(context, listen: false);

    DialogFactory.showAlertDialog(
        title: const Text('Tem certeza?'),
        content: const Text('O vídeo ainda não finalizou'),
        actions: [
          DialogActions(
            onPressed: () {
              controller.popScope(false);
              Navigator.of(context).pop();
            },
            child: const Text('NÃO'),
          ),
          DialogActions(
            onPressed: () {
              controller.popScope(true);
              Navigator.of(context).pop();
            },
            child: const Text('SIM'),
          ),
        ]);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<VideoPlayerController>(
          builder: (context, videoPlayerController, _) {
        return PopScope(
          canPop: videoPlayerController.isPop,
          onPopInvoked: (bool didPop) {
            if (didPop) {
              return;
            }
            _showDialog();
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Reproduzindo'),
            ),
            body: YoutubePlayerScaffold(
              backgroundColor: Colors.white,
              aspectRatio: 16 / 9,
              controller: _controller,
              builder: (context, player) {
                return Column(
                  children: [
                    player,
                    StreamBuilder(
                      stream: _controller.stream,
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
        );
      }),
    );
  }
}
