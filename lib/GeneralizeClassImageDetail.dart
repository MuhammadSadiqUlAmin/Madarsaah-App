import 'package:book_app/GeneralizeClass.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'PdfViewerBooks.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';



class GeneralizeClassImageDetail extends StatefulWidget {
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

  GeneralizeClassImageDetail(this.index, this.id, this.download, this.name, this.status, this.date,
      this.views, this.book_thumb, this.id_categories, this.id_sub_categories,);
  String  getBooKPdf()
  {
    return this.download;
  }

  @override
  GeneralizeClassImageDetailState createState() => GeneralizeClassImageDetailState();
}
void getPermission(String downloadLink , String bookName) async {
  print("getPermission");
  Map<PermissionGroup, PermissionStatus> permissions =
  await PermissionHandler().requestPermissions([PermissionGroup.storage]);

  final id = await  FlutterDownloader.enqueue(url: downloadLink , savedDir:"/storage/emulated/0/Download"  ,
    fileName: bookName+".pdf",
    showNotification: true,
    openFileFromNotification: true,
  );
}
class GeneralizeClassImageDetailState extends State<GeneralizeClassImageDetail> {
  bool downloading = false;
  var progressString = "";


  @override
  void initState() {

    super.initState();
  }


  // Future<void> downloadFile() async {
  //   // String path = await ExtStorage.getExternalStoragePublicDirectory(
  //   //   ExtStorage.DIRECTORY_DOWNLOADS);
  //   Dio dio = Dio();
  //   try{
  //     var dir = await getApplicationDocumentsDirectory();
  //     await dio.download(widget.download, "${dir.path}/mypdf.pdf",onReceiveProgress: (rec,total){
  //       print("rec: $rec, Total: $total");
  //       setState(() {
  //         downloading = true;
  //         progressString = ((rec/total)*100).toStringAsFixed(0)+"%";
  //       });
  //     });
  //   }catch(e){
  //     print(e);
  //   }
  //   setState(() {
  //     downloading = false;
  //     progressString = "Download Completed";
  //   });
  //   //   print("Download Complete");
  // }
  String bd;

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
        showDialogFunc(context, widget.book_thumb, widget.name, widget.views, widget.download);
//         setState(() {
//           //downloadFile();
//           //showDialogFunc(context, imgList[index], titleList[index], descList[index])
// print(widget.download);
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>PdfViewerBooks(URL: widget.download,),
//
//               )
//           );
//         });
        //here you can add youy action on grid element Tab
      },
      child: Card(

        child: Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            Container(
               // height: 300,
               // width: 600,
              decoration: BoxDecoration(
                color: Colors.white,

                  image: DecorationImage(
                      image: NetworkImage(widget.book_thumb , )
                  ),
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
              height: 40,

              child:    IconButton(
                icon: Icon(
                  Icons.download_rounded,
                  color: Color(0xff28006e),
                  size: 30,
                ),
                onPressed: () async {
                  getPermission(widget.download,  widget.name);
                    //downloadFile();

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => MyHomePage1(title: widget.download  ,BookName: widget.name  ),
                    //
                    //     )
                    // );

                },
              )

            )
          ],
        ),
      ),
    );

  }
}
showDialogFunc(context, img, title, desc,downloadlink) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height*0.6,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(

                        image: NetworkImage(img  ,

                        )

                    ),
                  ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   RaisedButton( shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                     //side: BorderSide(color: Colors.black)
                   ),
                     textColor: Color(0xff28006e),
                     child: Text(
                       'View PDF',


                     ),
                     onPressed: () {
                       print(downloadlink);
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) =>PdfViewerBooks(URL:downloadlink,),

                           )
                       );

                     },),
                   RaisedButton( shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                     //side: BorderSide(color: Colors.black)
                   ),
                     textColor: Color(0xff28006e),
                     child: Text(
                       'Download PDF',


                     ),
                     onPressed: ()async {


                       //downloadFile();
                       getPermission(downloadlink,title);



                     },),

                 ],
               )


              ],
            ),
          ),
        ),
      );
    },
  );
}