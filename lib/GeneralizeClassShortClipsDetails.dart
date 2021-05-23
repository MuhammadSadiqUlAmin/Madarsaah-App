import 'package:book_app/GeneralizeClass.dart';
import 'package:flutter/material.dart';


import 'VideoPlayerCHEWIE.dart';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';


class GeneralizeClassShortClipsDetail extends StatefulWidget {
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

  GeneralizeClassShortClipsDetail(this.index, this.id, this.download, this.name, this.status, this.date,
      this.views, this.book_thumb, this.id_categories, this.id_sub_categories,);
  String  getBooKPdf()
  {
    return this.download;
  }

  @override
  GeneralizeClassShortClipsDetailState createState() => GeneralizeClassShortClipsDetailState();
}
class GeneralizeClassShortClipsDetailState extends State<GeneralizeClassShortClipsDetail> {
  bool downloading = false;
  var progressString = "";
  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    final id = await  FlutterDownloader.enqueue(url: widget.download , savedDir:"/storage/emulated/0/Download"  ,
      fileName: widget.name+".mp4",
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  @override
  void initState() {

    super.initState();
  }





  @override
  var bytes;// = Base64Decoder(widget.book_image);
  Widget build(BuildContext context) {
    // bytes = Base64Decoder(widget.book_thumb);
    // return Padding(
    //   padding: const EdgeInsets.only(top: 10.0),
    //   child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //     return  GridView.builder(
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //       //itemCount: storeItems.length ,
    //       itemBuilder: (BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          //downloadFile();

          Navigator.push(
              context,
              MaterialPageRoute(
               // builder: (context) => VideoPlayerScreen(title: widget.download  ,BookName: widget.name,DATE:widget.date,download:widget.download  ),
                builder: (context) => ChewieDemo(Name: widget.name,Date: widget.date ,Url: widget.download ,  ),

              )
          );
        });
        //here you can add youy action on grid element Tab
      },
      child: Card(
        child: Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            Container(
               height: 170,
             // width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.book_thumb)
                  )
                ,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.bottomRight,
                height: 50,
                //color: Colors.greenAccent,

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

            )
          ],
        ),
      ),
    );

  }
}
