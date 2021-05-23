import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'CurvedAppBarI2.dart';

class ChewieDemo extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  String Name;
  String Url;
  String Date;
 ChewieDemo({this.Name , this.Date , this.Url});



  @override
  _ChewieDemoState createState() => new _ChewieDemoState();
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;



  bool downloading = false;
  var progressString = "";
  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    final id = await  FlutterDownloader.enqueue(url: widget.Url , savedDir:"/storage/emulated/0/Download"  ,
      fileName: widget.Name+".mp4",
      showNotification: true,
      openFileFromNotification: true,
    );
  }


  @override
  void initState() {
    debug: false;
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        widget.Url);
    await _videoPlayerController1.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      // Try playing around with some of these other options:


    );
    _platform = TargetPlatform.android;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "widget.title",
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar:PreferredSize(

            child: ClipPath(
              clipper: CurvedClipper(),
              child: Container(color: Color(0xff28006e), child: Column( mainAxisAlignment: MainAxisAlignment.center ,children: <Widget>[
                Image(
                  image: AssetImage('images/ss.png'),
                  height:MediaQuery.of(context).size.height*0.15 ,
                  width: MediaQuery.of(context).size.width*0.15,


                ),

              ],),),
            ),
            preferredSize:
            Size.fromHeight( MediaQuery.of(context).size.height*0.1)
          //    Size.fromHeight(kToolbarHeight + 200)
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Expanded(
              child: Container(


                child:
                _chewieController != null &&
                    _chewieController
                        .videoPlayerController.value.initialized
                    ? Chewie(
                  controller: _chewieController,


                )


                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Loading'),
                  ],
                ),
              ),
            ),
            Container(

                child:Text(widget.Name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Row(
              children: [
                Text("")
              ],
            ),
            Container(child:Text("DATE: " + widget.Date,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            )
            ),
            Row(
              children: [
                Text("")
              ],
            ),
            Row(
              children: [
                Text("")
              ],
            ),
            Row(
              children: [
                Text("")
              ],
            ),
            Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),Row(
              children: [
                Text("")
              ],
            ),
            RaisedButton.icon(
              label:  Text(
                'Download',
                style: TextStyle(fontSize: 20),

              ),
              icon: Icon(
                Icons.download_rounded,
                color: Color(0xff28006e),
                size: 30,



              ),
              onPressed: () async {
                getPermission();
                //downloadFile();


              },
            )

          ],
        )

        ),
      debugShowCheckedModeBanner: false,
      );

  }
}