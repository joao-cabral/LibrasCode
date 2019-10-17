import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:librascode/main.dart';

class YoutubeCustomWidget extends StatefulWidget {
  final String barcode;

  YoutubeCustomWidget({Key key, @required this.barcode}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(barcode: barcode);
}

class _MyAppState extends State<YoutubeCustomWidget> implements YouTubePlayerListener{
  double _currentVideoSecond = 0.0;
  String _playerState = "";
  FlutterYoutubeViewController _controller;
  //YoutubeScaleMode _mode = YoutubeScaleMode.none;
  String barcode;

  _MyAppState({Key key, @required this.barcode});

  @override
  void initState() {
     super.initState();
     convertUrlToId();
  }

  void convertUrlToId(){
    var idList = List();

    if (this.barcode.contains("https://www.youtube.com/watch?v")){
      idList = this.barcode.split("=");
      this.barcode = idList[1];
    }else if(this.barcode.contains("https://youtu.be/")){
      idList = this.barcode.split("/");
      this.barcode = idList[3];
    }
  }

  @override
  void onCurrentSecond(double second) {
   // print("onCurrentSecond second = $second");
    _currentVideoSecond = second;
  }

  @override
  void onError(String error) {
    print("onError error = $error");
    print("Esse é o valor :: $barcode");
  }

  @override
  void onReady() {
    print("onReady");
  }

  @override
  void onStateChange(String state) {
    print("onStateChange state = $state");
    setState(() {
      _playerState = state;
    });
  }

  @override
  void onVideoDuration(double duration) {
    print("onVideoDuration duration = $duration");
  }

  void _onYoutubeCreated(FlutterYoutubeViewController controller) {
    this._controller = controller;
  }

  void _play() {
    _controller.play();
  }

  void _pause() {
    _controller.pause();
  }

  void _changeScaleMode(YoutubeScaleMode mode) {
    setState(() {
        //_mode = mode;
        _controller.changeScaleMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
      appBar: AppBar(
        title: Text("Libras Code"),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: _onBackPressed,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: FlutterYoutubeView(
              onViewCreated: _onYoutubeCreated,
              listener: this,
              scaleMode: YoutubeScaleMode.fitWidth, // <option> fitWidth, fitHeight
              params: YoutubeParam(
                    videoId: barcode,//"KGG5jRO4_Sk",
                    showUI: false, 
                    startSeconds: 0.0, // <option>
                    autoPlay: false
              ) // <option>
            ) 
          ),
          Positioned(
          right: 0,
          left: 0,
          top: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              _buildControl(),
            ],
            ),
          ),
        ],
      )
    )
    );
  }
  
  Widget _buildControl() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          onPressed: _play,
          child: Text('Iniciar'),
          color: Colors.blue,
        ),
        new SizedBox(
          width: 30,
        ),
        RaisedButton(
          onPressed: _pause,
          child: Text('Pausar'),
          color: Colors.blue,          
        ),
      ],
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Você tem certeza?'),
        content: new Text('Você irá voltar para a tela anterior para ler um novo QR Code'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Não'),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScreenQr()),
              );
            },
            child: new Text('Sim'),
          ),
        ],
      ),
    ) ?? false;
  }
}