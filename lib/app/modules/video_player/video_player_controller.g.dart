// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoPlayerController on VideoPlayerControllerBase, Store {
  late final _$_historicAtom =
      Atom(name: 'VideoPlayerControllerBase._historic', context: context);

  List<HistoricModel> get historic {
    _$_historicAtom.reportRead();
    return super._historic;
  }

  @override
  List<HistoricModel> get _historic => historic;

  @override
  set _historic(List<HistoricModel> value) {
    _$_historicAtom.reportWrite(value, super._historic, () {
      super._historic = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'VideoPlayerControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$videoTitleAtom =
      Atom(name: 'VideoPlayerControllerBase.videoTitle', context: context);

  @override
  String get videoTitle {
    _$videoTitleAtom.reportRead();
    return super.videoTitle;
  }

  @override
  set videoTitle(String value) {
    _$videoTitleAtom.reportWrite(value, super.videoTitle, () {
      super.videoTitle = value;
    });
  }

  late final _$saveVideoAsyncAction =
      AsyncAction('VideoPlayerControllerBase.saveVideo', context: context);

  @override
  Future<void> saveVideo(YoutubeMetaData metadata) {
    return _$saveVideoAsyncAction.run(() => super.saveVideo(metadata));
  }

  late final _$getAllAsyncAction =
      AsyncAction('VideoPlayerControllerBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$VideoPlayerControllerBaseActionController =
      ActionController(name: 'VideoPlayerControllerBase', context: context);

  @override
  YoutubePlayerController configYoutubePLayer(String videoId) {
    final _$actionInfo = _$VideoPlayerControllerBaseActionController
        .startAction(name: 'VideoPlayerControllerBase.configYoutubePLayer');
    try {
      return super.configYoutubePLayer(videoId);
    } finally {
      _$VideoPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getTitle(String title) {
    final _$actionInfo = _$VideoPlayerControllerBaseActionController
        .startAction(name: 'VideoPlayerControllerBase.getTitle');
    try {
      return super.getTitle(title);
    } finally {
      _$VideoPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
videoTitle: ${videoTitle}
    ''';
  }
}
