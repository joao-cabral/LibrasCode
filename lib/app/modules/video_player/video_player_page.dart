import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
  DateFormat dateFormat = DateFormat('dd MMMM, yyyy', 'pt_BR');

  @override
  void initState() {
    _playerController =
        widget.controller.configYoutubePLayer(widget.videoId ?? 'ZtMzB5CoekE');
    widget.controller.getAll();

    _playerController.stream.firstWhere((data) {
      if (data.metaData.videoId.isNotEmpty) {
        widget.controller.saveVideo(data.metaData);

        // enter fullscreen when player is playing video
        if (data.playerState.code == 1) {
          _playerController.enterFullScreen();
          widget.controller.getTitle(data.metaData.title);
        }

        return true;
      }
      return false;
    });

    _playerController.stream.listen((data) {
      if (data.metaData.title.isNotEmpty) {
        widget.controller.getTitle(data.metaData.title);
      }
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
          controller: _playerController,
          autoFullScreen: true,
          builder: (context, player) {
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Modular.to.pop(),
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                      ),
                      const Text('Voltar')
                    ],
                  ),
                ),
                player,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(
                    builder: (_) {
                      return Text(
                        widget.controller.videoTitle,
                        style: GoogleFonts.robotoCondensed(
                          textStyle: const TextStyle(fontSize: 18),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Recentes:'),
                      TextButton(
                        onPressed: () {
                          _playerController.pauseVideo();
                          Modular.to
                              .pushNamed('/historic/')
                              .then((value) => widget.controller.getAll());
                        },
                        child: const Text(
                          'Todos',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ),
                Observer(builder: (_) {
                  if (widget.controller.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (widget.controller.historic.isNotEmpty) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListView.builder(
                          itemCount: widget.controller.historic.length < 5
                              ? widget.controller.historic.length
                              : 5,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: ListTile(
                              onTap: () {
                                _playerController.pauseVideo();
                                _playerController.loadVideoById(
                                    videoId: widget
                                        .controller.historic[index].videoId);
                              },
                              visualDensity:
                                  VisualDensity.adaptivePlatformDensity,
                              title:
                                  Text(widget.controller.historic[index].title),
                              subtitle: Text(
                                  '${widget.controller.historic[index].author}\n${dateFormat.format(widget.controller.historic[index].watchDate)}'),
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return const Center(
                    child: Text('Sem histórico'),
                  );
                })
              ],
            );
          },
        ),
      ),
    ));
  }
}
