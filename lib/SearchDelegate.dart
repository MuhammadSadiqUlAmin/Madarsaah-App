import 'package:book_app/GeneralizeClassShortClipsDetails.dart';
import 'package:book_app/SearchDelegateField.dart';
import 'package:flutter/material.dart';
import 'GeneralizeClass.dart';
import 'GeneralizeClassImageDetail.dart';
import 'GeneralizeClassListDetail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'frontpageui.dart';

List<GeneralizeClass> bookDetailsListabcd = [];
class GeneralSearchDelegate extends StatefulWidget {
  int scrollsuperclass;
  bool transferclass;
  String text;


  GeneralSearchDelegate({Key key, @required  this.scrollsuperclass , this.transferclass , this.text }) : super(key: key);
  //buttonIndex = scrollsuperclass;

  @override
  GeneralSearchDelegateState createState() => new GeneralSearchDelegateState();
}

const List<String> tabNames = const<String>[
  'Books'//, 'Short Clips', 'Hazrat Feroz\n Memon DB bayanat', 'Hazrat Muhammad \n Khurram DB Bayanat'//, 'quuz', 'corge', 'grault', 'garply', 'waldo'
];
bool firstscreen =  true;
bool firstscreenIndex = true;
class GeneralSearchDelegateState extends State<GeneralSearchDelegate> {
  Map checkList;
  bool firstcome = true;


  GeneralizeClass CheckClass;
  GeneralizeClass CheckClassB;
  int _screen = 0;
  List<GeneralizeClass> bookdetails = [];
  List<GeneralizeClass> Hazratbayandetshortclips = [];
  List<GeneralizeClass> HazratbayandetList= [];
  List<GeneralizeClass> HazratAqdasbayandetList= [];


  Future<List<GeneralizeClass>> _bookDetails(int a) async {
    print(widget.text);
    print("Printing A ");
    print(a);

    //  checkList = widget.bookDetailsListPreFretch.asMap();
    // CheckClass = checkList[0];
    // print("Printing B ");
    // print(CheckClass.name);

    if(a == 0 && firstcome ) {

      print("Printing B in if");
      firstcome = false;
      var data = await http
          .get("http://hazratkhurramabbasi.org/webservice/getShortClips/1000");
      var jsonData = json.decode(data.body);

      for (var hbayanvalshortclips in jsonData) {
        GeneralizeClass bayan1shortclips = GeneralizeClass(
            hbayanvalshortclips['id'],
            hbayanvalshortclips['name'],
            hbayanvalshortclips['audio'],
            hbayanvalshortclips['status'],
            hbayanvalshortclips['Date'],
            hbayanvalshortclips['views'],
            hbayanvalshortclips['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            hbayanvalshortclips['id_categories'],
            hbayanvalshortclips['id_sub_categories']
        );

        Hazratbayandetshortclips.add(bayan1shortclips);
      }


      var data1 = await http
          .get("http://hazratkhurramabbasi.org/webservice/getBooks/1000");
      var jsonData1 = json.decode(data1.body);

      for (var bookval in jsonData1) {

        GeneralizeClass books = GeneralizeClass(
            bookval['id'],
            bookval['name'],
            bookval['pdf'],
            bookval['status'],
            bookval['Date'],
            bookval['views'],
            bookval['book_thumb'],
            //bookval['book_thumb'],//= bytes,
            bookval['id_categories'],
            bookval['id_sub_categories']
        );
        bookdetails.add(books);
        print("function b");
      }
      var data2 = await http
          .get("http://hazratkhurramabbasi.org/webservice/getHazratAqdasBayanat/1000");
      var jsonData2 = json.decode(data2.body);

      for (var haqdasbayanval in jsonData2) {

        GeneralizeClass haqdasbayan1 = GeneralizeClass(
            haqdasbayanval['id'],
            haqdasbayanval['name'],
            haqdasbayanval['audio'],
            haqdasbayanval['status'],
            haqdasbayanval['Date'],
            haqdasbayanval['views'],
            haqdasbayanval['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            haqdasbayanval['id_categories'],
            haqdasbayanval['id_sub_categories']
        );
        HazratAqdasbayandetList.add(haqdasbayan1);
      }
      var data3 = await http
          .get("http://hazratkhurramabbasi.org/webservice/getHazratBayanat/1000");
      var jsonData3 = json.decode(data3.body);

      for (var HazratBayanatVal in jsonData3) {

        GeneralizeClass haqdasbayan1 = GeneralizeClass(
            HazratBayanatVal['id'],
            HazratBayanatVal['name'],
            HazratBayanatVal['audio'],
            HazratBayanatVal['status'],
            HazratBayanatVal['Date'],
            HazratBayanatVal['views'],
            HazratBayanatVal['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            HazratBayanatVal['id_categories'],
            HazratBayanatVal['id_sub_categories']
        );
        HazratbayandetList.add(haqdasbayan1);
      }
    }


    if(a == 0)
    {

      switch(widget.scrollsuperclass)
      {
        case 0:
        case 1:
          return HazratbayandetList;
        case 2:
          return HazratAqdasbayandetList;
        case 3:
          return  Hazratbayandetshortclips;
        case 4:
          return bookdetails;
      }
      return bookdetails;//bekar ha
    }else
    if(a == 1)
    {
      return  HazratbayandetList;//Hazratbayandetshortclips;
    }
    else if(a == 2){
      return  HazratAqdasbayandetList;//HazratAqdasbayandetList;
    }//HazratbayandetList
    else if(a == 3){
      return Hazratbayandetshortclips;//HazratbayandetList;
    }
    else if(a == 4){
      return bookdetails;//HazratbayandetList;
    }
    else{
      return bookdetails;}
  }

// END OF MY  ADDING BOOK
  @override
  void dispose() {
    // TODO: implement dispose
    firstscreen =  true;
    firstscreenIndex = true;
    super.dispose();
  }


// END OF ADDING CLIPS
  @override
  Widget build(BuildContext context) {

    return new DefaultTabController(
      length: tabNames.length,
      child: new Scaffold(
        appBar: new AppBar(
          title:  Padding(
            padding: EdgeInsets.only(
              left: 74,
              top: 5,

              //  horizontal: 115,
              // // vertical: 40,
            ),
            child: Image(
              image: AssetImage('images/ss.png'),
              height: 45.0,
              width: 60.0,


            ),
          ),
          // Text(
          //   "Khanqah e Aarfi",
          //   style: TextStyle(
          //     fontSize: 23.0,
          //     fontWeight: FontWeight.bold,
          //     fontStyle: FontStyle.italic,
          //   ),
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                // showSearch(context: context, );
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SearchDelegateField(  ),
                ),);


                // showSearch(
                //   context: context,
                //   delegate: BookSearch(),

                //);

              },
            )
          ],
          backgroundColor: Theme.of(context).primaryColor,

        ),


        body: new TabBarView(
          children: new List<Widget>.generate(tabNames.length, (int index) {
            switch (_indexMethod(_screen,widget.scrollsuperclass)) {
              case 0:return new Column(

                children: <Widget>[

                  FutureBuilder(
                      future: _bookDetails(_screen)

                      ,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              color: Theme.of(context).accentColor,
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GeneralizeClassListDetail(
                                        snapshot.data[index],
                                        snapshot.data[index].id,
                                        snapshot.data[index].download,
                                        snapshot.data[index].name,
                                        snapshot.data[index].status,
                                        snapshot.data[index].Date,
                                        snapshot.data[index].views,
                                        snapshot.data[index].book_image,
                                        snapshot.data[index].id_categories,
                                        snapshot.data[index].id_sub_categories
                                    );
                                  }),
                            ),
                          );
                        } else {
                          return Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 270.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          );
                        }
                      })
                ],
              );

            //   return new Center(
            //     child: new Text('going'),);

              case 1: return new Column(

                children: <Widget>[

                  FutureBuilder(
                      future: _bookDetails(_screen)

                      ,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              color: Theme.of(context).accentColor,
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GeneralizeClassListDetail(
                                        snapshot.data[index],
                                        snapshot.data[index].id,
                                        snapshot.data[index].download,
                                        snapshot.data[index].name,
                                        snapshot.data[index].status,
                                        snapshot.data[index].Date,
                                        snapshot.data[index].views,
                                        snapshot.data[index].book_image,
                                        snapshot.data[index].id_categories,
                                        snapshot.data[index].id_sub_categories
                                    );
                                  }),
                            ),
                          );
                        } else {
                          return Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 270.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          );
                        }
                      })
                ],
              );
              case 2:
                return new Column(

                  children: <Widget>[
                    // new TextField(
                    //   decoration: new InputDecoration(
                    //       hintText: "type"
                    //   ),
                    //   onSubmitted: (String str){
                    //     setState(() {
                    //       result=str;
                    //     });
                    //   },
                    // )

// child: new Text('First screen, ${tabNames[index]}'),
                    FutureBuilder(
                        future: _bookDetails(_screen)

                        ,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data != null) {
                            return Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                color: Theme.of(context).accentColor,
                                child: ListView.builder(
                                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return GeneralizeClassListDetail(
                                          snapshot.data[index],
                                          snapshot.data[index].id,
                                          snapshot.data[index].download,
                                          snapshot.data[index].name,
                                          snapshot.data[index].status,
                                          snapshot.data[index].Date,
                                          snapshot.data[index].views,
                                          snapshot.data[index].book_image,
                                          snapshot.data[index].id_categories,
                                          snapshot.data[index].id_sub_categories
                                      );
                                    }),
                              ),
                            );
                          } else {
                            return Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 270.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            );
                          }
                        })
                  ],
                );
              case 3: return new Column(

                children: <Widget>[

                  FutureBuilder(
                      future: _bookDetails(_screen)

                      ,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data != null) {
                          return Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              color: Theme.of(context).accentColor,
                              child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GeneralizeClassShortClipsDetail(
                                        snapshot.data[index],
                                        snapshot.data[index].id,
                                        snapshot.data[index].download,
                                        snapshot.data[index].name,
                                        snapshot.data[index].status,
                                        snapshot.data[index].Date,
                                        snapshot.data[index].views,
                                        snapshot.data[index].book_image,
                                        snapshot.data[index].id_categories,
                                        snapshot.data[index].id_sub_categories
                                    );
                                  }),
                            ),
                          );
                        } else {
                          return Container(
                            child: Padding(
                              padding: EdgeInsets.only(top: 270.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          );
                        }
                      })
                ],
              );
              case 4:
                return new Column(

                  children: <Widget>[
                    // new TextField(
                    //   decoration: new InputDecoration(
                    //       hintText: "type"
                    //   ),
                    //   onSubmitted: (String str){
                    //     setState(() {
                    //       result=str;
                    //     });
                    //   },
                    // )

// child: new Text('First screen, ${tabNames[index]}'),
                    FutureBuilder(
                        future: _bookDetails(_screen)

                        ,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data != null) {
                            return Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                //width: 500,
                                color: Theme.of(context).accentColor,
                                child: GridView.builder(

                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return GeneralizeClassImageDetail(
                                          snapshot.data[index],
                                          snapshot.data[index].id,
                                          snapshot.data[index].download,
                                          snapshot.data[index].name,
                                          snapshot.data[index].status,
                                          snapshot.data[index].Date,
                                          snapshot.data[index].views,
                                          snapshot.data[index].book_image,
                                          snapshot.data[index].id_categories,
                                          snapshot.data[index].id_sub_categories
                                      );
                                    }),
                              ),
                            );
                          } else {
                            return Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 270.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            );
                          }
                        })
                  ],
                );

            //enter code
            }
          }),
        ),
        bottomNavigationBar:  new Column(

          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            new BottomNavigationBar(
              currentIndex: _screenMethod(_screen, widget.scrollsuperclass),
              onTap: (int index) {
                setState(() {


                  _screen =index;//_indexMethod(index);
                });
              },
              items: [
                new BottomNavigationBarItem(
                    icon: new IconButton(icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ), onPressed: (){
                      print("HSDGVHNVDSNVSDGNVDSBGDSCFASBGFDAHNAGSMHASMVXCX MN");
                      firstscreen =  true;
                      firstscreenIndex = true;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => frontpageui(
                        ),
                      ),);

                    }),
                    title: new Text('Home'),backgroundColor: Color(0xff28006e)
                ),

                new BottomNavigationBarItem(
                    icon: new Icon(Icons.multitrack_audio_outlined),
                    title: new Text('Bayanats'),backgroundColor: Color(0xff28006e)
                ),
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.library_books),
                    title: new Text('Ashaars'),backgroundColor: Color(0xff28006e)
                ),
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.movie_creation_outlined),
                    title: new Text('Short'),backgroundColor: Color(0xff28006e)
                ),
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.menu_book),
                    title: new Text('Books\n'),backgroundColor: Color(0xff28006e)
                ),

              ],
            ),
          ],
        ),
      ),

    );
  }
}
int _screenMethod(int FuncInt, int value)
{
  if(firstscreen)
  {
    print("Hit on fun 1");
    firstscreen = false;
    FuncInt = value;
  }
  return FuncInt;
}
int _indexMethod(int FuncInt , int value)
{
  if(firstscreenIndex)
  {
    print("Hit on fun 2");
    firstscreenIndex = false;
    FuncInt = value;
  }
  return FuncInt;
}
