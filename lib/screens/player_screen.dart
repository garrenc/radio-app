import 'package:flutter/material.dart';
import 'package:perm_fm/screens/alarm_screen.dart';
import 'package:radio_player/radio_player.dart';

import '../notification_api.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen(this.name, this.imagePath, this.url, this.isClicked, {Key? key})
      : super(key: key);
  String url;
  String imagePath;
  String name;
  bool isClicked;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  var isPlaying = false;
  static final RadioPlayer _radioPlayer = RadioPlayer();
  List<String>? metadata;
  bool isSet = false;
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    initRadioPlayer();
  }

  void initRadioPlayer() {
    _radioPlayer.setChannel(
      title: widget.name,
      url: widget.url,
      imagePath: widget.imagePath,
    );

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
    if (widget.isClicked) {
      _radioPlayer.play();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /*void listenNotifications() {
    NotificationApi.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? payload) {
    _radioPlayer.play();
    isSet = false;
    isOn = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  var pickedTime;*/
  @override
  Widget build(BuildContext context) {
    /*if (ModalRoute.of(context)?.settings.arguments != null) {
      pickedTime = ModalRoute.of(context)?.settings.arguments as DateTime;
      isSet = true;
    }*/

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.name),
        foregroundColor: Colors.white,
        /*actions: [
          isSet
              ? Container(
                  height: 5,
                  width: 5,
                )
              : Text(
                  pickedTime,
                  style: TextStyle(color: Colors.white),
                ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AlarmScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.alarm),
              ),
            ],
          ),
        ],)*/
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 300,
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Image.asset(widget.imagePath),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              metadata?[0] ?? '',
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
              maxLines: 3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              metadata?[1] ?? '',
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              iconSize: 85,
              onPressed: isPlaying ? _radioPlayer.pause : _radioPlayer.play,
              icon: isPlaying
                  ? Icon(
                      Icons.pause_circle_filled,
                      color: Colors.black,
                    )
                  : Icon(
                      Icons.play_circle_filled,
                      color: Colors.black,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
