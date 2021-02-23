import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:payouts/dummy_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';

import 'package:payouts/widgets/radio_card.dart';

class RadioPage extends StatefulWidget {
  var playerState = FlutterRadioPlayer.flutter_radio_paused;

  var volume = 1;
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int checker = -1;

  FlutterRadioPlayer _flutterRadioPlayer = new FlutterRadioPlayer();

  @override
  void initState() {
    super.initState();
    initRadioService();
  }

  Future<void> initRadioService() async {
    try {
      await _flutterRadioPlayer.init("dcss", "sdsd", "", "false");
    } on PlatformException {
      print("Exception occurred while trying to register the services.");
    }
  }

  funcPlay(index, url) async {
    // print("button press data: " + data);
    _flutterRadioPlayer.setUrl(url, "false");
    await _flutterRadioPlayer.play();
    setState(() {
      if (checker == index) {
        checker = -1;
      } else {
        checker = index;
      }
    });
  }

  funcStop(index) async {
    setState(() {
      if (checker == index) {
        checker = -1;
      } else {
        checker = index;
      }
    });
    await _flutterRadioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Моё настроение',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return StreamBuilder(
            stream: _flutterRadioPlayer.isPlayingStream,
            initialData: widget.playerState,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              String returnData = snapshot.data;
              // print("object data: " + returnData);

              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                color: checker == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey[100],
                margin: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () => checker == index
                      ? funcStop(index)
                      : funcPlay(index, DUMMY_RADIOS[index].url),
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Text(
                          DUMMY_RADIOS[index].emoji,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        DUMMY_RADIOS[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: checker == index ? Colors.white : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        itemCount: DUMMY_RADIOS.length,
      ),
    );
  }
  // return Scaffold(
  //   appBar: AppBar(title: Text('check')),
  //   body: Center(
  //     child: Column(
  //       children: <Widget>[
  //         StreamBuilder(
  //             stream: _flutterRadioPlayer.isPlayingStream,
  //             initialData: widget.playerState,
  // builder:
  //     (BuildContext context, AsyncSnapshot<String> snapshot) {
  //               String returnData = snapshot.data;
  //               print("object data: " + returnData);
  //               switch (returnData) {
  // case FlutterRadioPlayer.flutter_radio_stopped:
  //                   return RaisedButton(
  //                       child: Text("Start listening now"),
  //                       onPressed: () async {
  //                         await initRadioService();
  //                       });
  //                   break;
  //                 case FlutterRadioPlayer.flutter_radio_loading:
  //                   return Text("Loading stream...");
  //                 case FlutterRadioPlayer.flutter_radio_error:
  //                   return RaisedButton(
  //                       child: Text("Retry ?"),
  //                       onPressed: () async {
  //                         await initRadioService();
  //                       });
  //                   break;
  //                 default:
  //                   return Row(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         IconButton(
  //                             onPressed: () async {
  //                               print("button press data: " +
  //                                   snapshot.data.toString());
  //                               await _flutterRadioPlayer.playOrPause();
  //                             },
  //                             icon: snapshot.data ==
  //                                     FlutterRadioPlayer.flutter_radio_playing
  //                                 ? Icon(Icons.pause)
  //                                 : Icon(Icons.play_arrow)),
  //                         IconButton(
  //                             onPressed: () async {
  //                               await _flutterRadioPlayer.stop();
  //                             },
  //                             icon: Icon(Icons.stop))
  //                       ]);
  //                   break;
  //               }
  //             }),
  //         Slider(
  //             value: widget.volume,
  //             min: 0,
  //             max: 1.0,
  //             onChanged: (value) => setState(() {
  //                   widget.volume = value;
  //                   _flutterRadioPlayer.setVolume(widget.volume);
  //                 })),
  //         Text("Volume: " + (widget.volume * 100).toStringAsFixed(0)),
  //         SizedBox(
  //           height: 15,
  //         ),
  //         Text("Metadata Track "),
  //         StreamBuilder<String>(
  //             initialData: "",
  //             stream: _flutterRadioPlayer.metaDataStream,
  //             builder: (context, snapshot) {
  //               return Text(snapshot.data);
  //             }),
  //         RaisedButton(
  //             child: Text("Change URL"),
  //             onPressed: () async {
  // _flutterRadioPlayer.setUrl(
  //     "http://209.133.216.3:7018/;stream.mp3", "false");
  //             })
  //       ],
  //     ),
  //   ),
  // );
  // }
}
