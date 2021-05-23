import 'package:book_app/GeneralizeClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:permission_handler/permission_handler.dart';

import 'AudioPlayerTesting.dart';


class GeneralizeClassListDetail extends StatefulWidget {
  final GeneralizeClass index;
  final String id;
  final String download;
  final String name;
  final String status;
  final String date;
  final String views;
  final String book_thumb;
  //final Uint8List book_thumb;
  final String id_categories;
  final String id_sub_categories;
  //var testThumb;


  GeneralizeClassListDetail(this.index, this.id, this.download, this.name, this.status, this.date,
      this.views, this.book_thumb, this.id_categories, this.id_sub_categories,);
  String  getBooKPdf()
  {
    return this.download;
  }

  @override
  GeneralizeClassListDetailState createState() => GeneralizeClassListDetailState();
}
class GeneralizeClassListDetailState extends State<GeneralizeClassListDetail> {
  bool downloading = false;
  var progressString = "";

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    final id = await FlutterDownloader.enqueue(
      url: widget.download,
      savedDir: "/storage/emulated/0/Download",
      fileName: widget.name + ".mp3",
      showNotification: true,
      openFileFromNotification: true,
    );
  }






  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
@override
  void dispose() {
  _audioPlayer.pause();
    // TODO: implement dispose
    super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        //currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
       // completeTime = duration.toString().split(".")[0];
      });
    });
  }



  @override
  var bytes;// = Base64Decoder(widget.book_image);
  Widget build(BuildContext context) {
    // bytes = Base64Decoder(widget.book_thumb);

    return GestureDetector(
      onTap: () {
        setState(() {
          //downloadFile();

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChewieDemo1(
                  Url: widget.download ,Date: widget.date,Name: widget.name,
                ),

              )
          );
        });
        //here you can add youy action on grid element Tab
      },
      child: Card(
        child: Stack(
          alignment: FractionalOffset.topLeft,
          children: <Widget>[
            Container(
              // height: 500,
              // width: 300,
             child: Text(_breakingLine(widget.name , 37)+"\nDate: "+widget.date+"\nViews: "+widget.views,
             style: TextStyle(
                 fontWeight: FontWeight.bold
             ),
             ),

            ),

            Container(
                alignment: Alignment.bottomRight,
                height: 40,

                child:    IconButton(
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

            ),
            Container(
                height: 40,
                child:Align(
               alignment: Alignment(0.75,1),

                child:  IconButton(icon:Icon(Icons.share,
    color: Color(0xff28006e),
                ),
                    onPressed:()async{
                      await FlutterShare.share(
                          title: 'Audio',
                          text: widget.name,
                          linkUrl: widget.download,
                          chooserTitle: 'Example Chooser Title'
                      );

                    }

                ),

            )
    )

          ],
        ),
      ),
    );


  }
}
String _breakingLine(String OriName, int breakLine)
{
  int totallength = OriName.length;
int check =totallength - breakLine ;
if(totallength>breakLine) {
  String subString1 = OriName.substring(0, breakLine);
  String substring2 = OriName.substring(breakLine + 1, totallength);
  if(check>breakLine)
    { substring2 = OriName.substring(breakLine + 1, breakLine*2);
      String substring3 = OriName.substring(breakLine*2 + 1,totallength);
      return subString1 + "\n" + substring2 + "\n" +substring3;
    }
  else{
    return subString1 + "\n" + substring2;
  }

}
return OriName;
}