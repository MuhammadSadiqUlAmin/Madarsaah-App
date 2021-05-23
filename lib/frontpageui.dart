
import 'package:book_app/ScrollTestingClass.dart';

import 'package:flutter/material.dart';
import 'AudioPlayerTesting.dart';
import 'CurvedTestingMain.dart';

import 'package:audioplayers/audioplayers.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_offline/flutter_offline.dart';
import 'package:book_app/FlutterRadioPlayerTesting.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';


String fgh = "";
String LiveURL = "https://listen.mixlr.com/";
class frontpageui extends StatefulWidget {

  @override
  _frontpageuiState createState() => _frontpageuiState();
}
List<String>  sampleUrl = [];
class _frontpageuiState extends State<frontpageui> {





  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // audioStart();
    // playingStatus();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  // Future<void> audioStart() async {
  //   await FlutterRadio.audioStart();
  //   print('Audio Start OK');
  // }
  // Future playingStatus() async {
  //   bool isP = await FlutterRadio.isPlaying();
  //   setState(() {
  //     isPlaying = isP;
  //   });
  // }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
            child: ClipPath(
              clipper: CustomAppBar(),
              child: Container(color: Color(0xff28006e), child: Column( mainAxisAlignment: MainAxisAlignment.center ,children: <Widget>[
                Image(
                  image: AssetImage('images/ss.png'),
                  height:MediaQuery.of(context).size.height*0.35 ,
                  width: MediaQuery.of(context).size.width*0.35,


                ),

              ],),),
            ),
            preferredSize:
            Size.fromHeight( MediaQuery.of(context).size.height*0.35)
          //    Size.fromHeight(kToolbarHeight + 200)
        ),

        endDrawer: Drawer(



          child:Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,



            color: Color(0xff28006e),
            child:
            ListView(


              children: <Widget>[


                // child: new Text('Bottom'),


                Image(image:
                AssetImage('images/drawerimage.jpeg'),
                  fit: BoxFit.fill,


                ),









                RaisedButton.icon(

                    onPressed: _launchURL,
                    icon: Icon(
                      Icons.web,
                      color: Colors.white,
                    ),
                    color: Color(0xff28006e),
                    textColor: Colors.white,
                    label: Text('Website', style: TextStyle(fontWeight: FontWeight.normal,
                        fontSize: 25)
                    )


                ),
                RaisedButton.icon(

                    onPressed: _launchAddressURL,
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    color: Color(0xff28006e),
                    textColor: Colors.white,
                    label: Text('Address', style: TextStyle(fontWeight: FontWeight.normal,
                        fontSize: 23)
                    )


                ),


              ],
            ),
          ),
        ),

        body: SingleChildScrollView(
          child:Column(
              children: <Widget>[

                Column(children: <Widget>[

                  Builder(
                    builder: (BuildContext context) {
                      return OfflineBuilder(
                        connectivityBuilder: (BuildContext context,
                            ConnectivityResult connectivity, Widget child) {
                          final bool connected =
                              connectivity != ConnectivityResult.none;
                          return SingleChildScrollView(
                              child: Container(
                                height: 60,
                                width: 250,
                                //fit: StackFit.expand,

                                child:
                                Positioned(
                                  left: 0.0,
                                  right: 0.0,
                                  height: 32.0,
                                  child:
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    color:
                                    connected ? Color(0xffffffff).withOpacity(0) : Color(0xff28006e),
                                    child: connected
                                        ?   Visibility (

                                        visible: false,
                                        child:
                                        Center(
                                          // crossAxisAlignment:CrossAxisAlignment.center ,
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          // children: <Widget>[
                                          child: Text(
                                            // " خانقاہ عارفی  "
                                            LiveURL ,
                                            style: TextStyle(color: Colors.black,fontSize:8 ,fontWeight: FontWeight.bold),
                                          ),


                                          // ]
                                        )
                                    )
                                        : Column( crossAxisAlignment:CrossAxisAlignment.center ,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "NO INTERNET!",
                                          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        SizedBox(
                                          width: 12.0,
                                          height: 12.0,
                                          // child: CircularProgressIndicator(
                                          //   strokeWidth: 2.0,
                                          //   valueColor:
                                          //   AlwaysStoppedAnimation<Color>(
                                          //       Colors.white),
                                          // ),
                                        ),

                                      ],

                                    ),
                                  ),
                                ),

                              )
                          );

                        },
                        child: Center(
                          child: Text(""),
                        ),
                      );
                    },
                  ),
                  Row(
                    children:<Widget>[
                      Text("")
                    ],),
        SingleChildScrollView(
          child:
                  GridView.count(
                      shrinkWrap: true,

                      crossAxisCount: 3 ,
                      children: <Widget>[

                        Container( alignment: Alignment.center,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              // side: BorderSide(color: Colors.black)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //side: BorderSide(color: Color(0xfff2f2f2))
                              ),
                              onPressed: ()  { Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ScrollTestingClass(scrollsuperclass: 1,transferclass: true,


                                ),
                              ),);},
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              child: Column( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.multitrack_audio,size: 40, color: Color(0xff28006e),),
                                  Text("Bayanats",
                                      style:TextStyle(

                                        fontWeight: FontWeight.bold,

                                      ))
                                ],
                              ),
                            ),


                            //color: Colors.blue,
                          ),
                        ),
                        Container( alignment: Alignment.center,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              //  side: BorderSide(color: Colors.black)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //side: BorderSide(color: Color(0xfff2f2f2))
                              ),
                              onPressed: ()  { Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ScrollTestingClass(scrollsuperclass: 2,transferclass: true,


                                ),
                              ),);},
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              child: Column( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(MdiIcons.microphoneVariant,size: 40, color: Color(0xff28006e),),
                                  Text("Ashaars",
                                      style:TextStyle(

                                        fontWeight: FontWeight.bold,

                                      ))
                                ],
                              ),
                            ),


                            //color: Colors.blue,
                          ),
                        ),
                        Container( alignment: Alignment.center,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              // side: BorderSide(color: Colors.black)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //side: BorderSide(color: Color(0xfff2f2f2))
                              ),
                              //textColor: Color(0xff28006e),
                              onPressed: ()  { Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ScrollTestingClass(scrollsuperclass: 3,transferclass: true,


                                ),
                              ),);},
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              child: Column( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(MdiIcons.movieOpen,size: 40,color: Color(0xff28006e),

                                  ),
                                  Text("Short Clips",
                                      style:TextStyle(

                                        fontWeight: FontWeight.bold,

                                      )
                                  )
                                ],
                              ),
                            ),


                            //color: Colors.blue,
                          ),
                        ),
                        Container( alignment: Alignment.center,

                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              //side: BorderSide(color: Colors.black)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //side: BorderSide(color: Color(0xfff2f2f2))
                              ),
                              onPressed: () => {},
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              child: Column( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(MdiIcons.clock,size: 40, color: Color(0xff28006e) ),
                                  Text("Namaz",
                                      style:TextStyle(
                                        //fontSize: 13,
                                        fontWeight: FontWeight.bold,

                                      )
                                  )
                                ],
                              ),
                            ),


                            // color: Colors.blue,
                          ),
                        ),
                        Container( alignment: Alignment.center,
                          child: Card(
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              //side: BorderSide(color: Colors.black)
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //side: BorderSide(color: Colors.black)
                              ),
                              onPressed: () { Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ScrollTestingClass(scrollsuperclass: 4,transferclass: true,


                                ),
                              ),);},
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              child: Column( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.menu_book_sharp,size: 40, color: Color(0xff28006e),),
                                  Text("Books",
                                      style:TextStyle(

                                        fontWeight: FontWeight.bold,

                                      ))
                                ],
                              ),
                            ),


                            //color: Colors.blue,
                          ),
                        ),
                        Container(


                          child: Card(
                            shadowColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              //side: BorderSide(color: Colors.black)
                            ),


                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //side: BorderSide(color: Colors.black)
                              ),
                              onPressed: () {
                                //   Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) => LocalAudio(
                                //
                                //
                                //   ),
                                // ),);
                              },
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
                              child: Column( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(MdiIcons.calendarCheck,size: 40, color: Color(0xff28006e),),
                                  Text("Schedule",
                                      style:TextStyle(

                                        fontWeight: FontWeight.bold,

                                      ))
                                ],
                              ),
                            ),


                            //color: Colors.blue,
                          ),
                        ),


                      ]
                  ),
        )

                ],
                ),
                // }),




                //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                // bottomNavigationBar: BottomAppBar(
                //   shape: CircularNotchedRectangle(),
                // child:
                //


                // color: Colors.grey,
                Column(
                  crossAxisAlignment:CrossAxisAlignment.end ,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Html(
                      data: //
                      """
         <iframe src="http://hazratkhurramabbasi.org/liveAudioPlayer.html" style="position:fixed; top:0; left:0; bottom:0; right:0; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;">
Your browser doesn't support iframes
</iframe>
          """// htmlData
                      ,
                      //Optional parameters:

                      customRender: {
                        "flutter": (RenderContext context, Widget child, attributes, _) {
                          return FlutterLogo(
                            style: (attributes['horizontal'] != null)
                                ? FlutterLogoStyle.horizontal
                                : FlutterLogoStyle.markOnly,
                            textColor: context.style.color,
                            size: context.style.fontSize.size * 5,
                          );
                        },
                      },
                      onLinkTap: (url) {
                        print("Opening $url...");
                      },
                      onImageTap: (src) {
                        print(src);
                      },
                      onImageError: (exception, stackTrace) {
                        print(exception);
                      },
                    ),


                  ],
                ),

              ]
          ),
        )
    );

  }
}
_launchURL() async {
  const url = 'http://hazratkhurramabbasi.org';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchAddressURL() async {
  const url = 'https://goo.gl/maps/yNav4s2xybsapqNK6';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchAshaarURL() async {
  const url = 'http://hazratkhurramabbasi.org/bayanat/viewBayanat/OA';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchHamdrURL() async {
  const url = 'http://hazratkhurramabbasi.org/bayanat/viewBayanat/MTA';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchNaatURL() async {
  const url = 'http://hazratkhurramabbasi.org/bayanat/viewBayanat/OQ';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchManajatURL() async {
  const url = 'http://hazratkhurramabbasi.org/bayanat/viewBayanat/MTE';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

