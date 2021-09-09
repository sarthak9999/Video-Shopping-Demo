import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sevenxsales/View.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int len = 0;
  List<VideoPlayerController> _controller = new List(4);
  List<Future<void>> _initializeVideoPlayerFuture = List(4);
  List<Map> _ds = [];

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Video")
        .get()
        .then((QuerySnapshot snap) {
      print('${snap.docs.length} length');
      if (snap.docs.length > 0) {
        len = snap.docs.length;
        for (var i = 0; i < len; i++) {
          print('${snap.docs[i]['url']} length');
          _controller[i] = VideoPlayerController.network(snap.docs[i]['url']);
          _ds.add(snap.docs[i].data());
          _initializeVideoPlayerFuture[i] = _controller[i].initialize();
          _controller[i].setVolume(1);
          _controller[i].setLooping(true);
        }
      }
    }).whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    for (var i = 0; i < len; i++) {
      _controller[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_ds);
    return Scaffold(
      body: TikTokStyleFullPageScroller(
        contentSize: len,
        builder: (context, index) {
          return FutureBuilder(
            future: _initializeVideoPlayerFuture[index],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _controller[index].play();
                return Stack(
                  children: [
                    VideoPlayer(_controller[index]),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => View(_ds[index]));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 758.0, left: 120),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.7),
                                  width: 0.5),
                              color: Colors.white.withOpacity(0.5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 4),
                            child: Text(
                              "View Product",
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
