import 'package:book_app/GeneralizeClassShortClipsDetails.dart';
import 'package:book_app/SearchDelegateField.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'GeneralizeClass.dart';
import 'GeneralizeClassImageDetail.dart';
import 'GeneralizeClassListAshaarDetails.dart';
import 'GeneralizeClassListDetail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'frontpageui.dart';

List<GeneralizeClass> bookDetailsListabcd = [];
class ScrollTestingClass extends StatefulWidget {
  int scrollsuperclass;
  bool transferclass;


  ScrollTestingClass({Key key, @required  this.scrollsuperclass , this.transferclass }) : super(key: key);
  //buttonIndex = scrollsuperclass;

  @override
  _ScrollTestingClassState createState() => new _ScrollTestingClassState();
}

const List<String> tabNames = const<String>[
  'Books'//, 'Short Clips', 'Hazrat Feroz\n Memon DB bayanat', 'Hazrat Muhammad \n Khurram DB Bayanat'//, 'quuz', 'corge', 'grault', 'garply', 'waldo'
];
bool firstscreen =  true;
bool firstscreenIndex = true;
class _ScrollTestingClassState extends State<ScrollTestingClass> {
Map checkList;
bool firstcome = true;


GeneralizeClass CheckClass;
GeneralizeClass CheckClassB;
  int _screen = 0;
  List<GeneralizeClass> bookdetails = [];
  List<GeneralizeClass> Hazratbayandetshortclips = [];
  List<GeneralizeClass> HazratbayandetList= [];
  List<GeneralizeClass> AsharNaatHamdList= [];


  Future<List<GeneralizeClass>> _bookDetails(int a) async {
    print("Printing A ");
    print(a);


//     Navigator.push(context, MaterialPageRoute(
// \      builder: (context) => MyHomePage(),);

    // GeneralizeClass checking;
    // checking = widget.bookdetailsFromUI[0];
    // print("Printing Name ");
    // print(checking.name);
    //  checkList = widget.bookDetailsListPreFretch.asMap();
    // CheckClass = checkList[0];
    // print("Printing B ");
    // print(CheckClass.name);

    print("Book list is null");
    if (a == 0 && firstcome) {
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
      //fetching data for Hamd
      var dataHamd = await http
          .get(
          "http://hazratkhurramabbasi.org/webservice/getSubCategoryData/10/1000");
      var jsonDataHamd = json.decode(dataHamd.body);

      for (var AsharNaatHamd in jsonDataHamd) {
        GeneralizeClass AshaarnaatHamd = GeneralizeClass(
            AsharNaatHamd['id'],
            AsharNaatHamd['name'],
            AsharNaatHamd['audio'],
            AsharNaatHamd['status'],
            AsharNaatHamd['Date'],
            AsharNaatHamd['views'],
            AsharNaatHamd['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            AsharNaatHamd['id_categories'],
            AsharNaatHamd['id_sub_categories']
        );
        AsharNaatHamdList.add(AshaarnaatHamd);
      }
      //fetching data for Naat
      var dataNaat = await http
          .get(
          "http://hazratkhurramabbasi.org/webservice/getSubCategoryData/9/1000");
      var jsonDataNaat = json.decode(dataNaat.body);

      for (var AsharNaatHamd in jsonDataNaat) {
        GeneralizeClass AshaarnaatHamd = GeneralizeClass(
            AsharNaatHamd['id'],
            AsharNaatHamd['name'],
            AsharNaatHamd['audio'],
            AsharNaatHamd['status'],
            AsharNaatHamd['Date'],
            AsharNaatHamd['views'],
            AsharNaatHamd['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            AsharNaatHamd['id_categories'],
            AsharNaatHamd['id_sub_categories']
        );
        AsharNaatHamdList.add(AshaarnaatHamd);
      }

      //fetching data for Ashar
      var dataAshar = await http
          .get(
          "http://hazratkhurramabbasi.org/webservice/getSubCategoryData/8/1000");
      var jsonDataAshaar = json.decode(dataAshar.body);

      for (var AsharNaatHamd in jsonDataAshaar) {
        GeneralizeClass AshaarnaatHamd = GeneralizeClass(
            AsharNaatHamd['id'],
            AsharNaatHamd['name'],
            AsharNaatHamd['audio'],
            AsharNaatHamd['status'],
            AsharNaatHamd['Date'],
            AsharNaatHamd['views'],
            AsharNaatHamd['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            AsharNaatHamd['id_categories'],
            AsharNaatHamd['id_sub_categories']
        );
        AsharNaatHamdList.add(AshaarnaatHamd);
      }


      //fetching data for munajat
      var dataMunajat = await http
          .get(
          "http://hazratkhurramabbasi.org/webservice/getSubCategoryData/11/1000");
      var jsonDataMunajat = json.decode(dataMunajat.body);

      for (var AsharNaatHamd in jsonDataMunajat) {
        GeneralizeClass AshaarnaatHamd = GeneralizeClass(
            AsharNaatHamd['id'],
            AsharNaatHamd['name'],
            AsharNaatHamd['audio'],
            AsharNaatHamd['status'],
            AsharNaatHamd['Date'],
            AsharNaatHamd['views'],
            AsharNaatHamd['bayan_image'],
            //bookval['book_thumb'],//= bytes,
            AsharNaatHamd['id_categories'],
            AsharNaatHamd['id_sub_categories']
        );
        AsharNaatHamdList.add(AshaarnaatHamd);
      }


      var data3 = await http
          .get(
          "http://hazratkhurramabbasi.org/webservice/getHazratBayanat/1000");
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
        _screen = widget.scrollsuperclass;
        switch(widget.scrollsuperclass)
        {
          case 0:
          case 1:
            return HazratbayandetList;
          case 2:
            return AsharNaatHamdList;
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
      return  AsharNaatHamdList;//HazratAqdasbayandetList;
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
              left: MediaQuery.of(context).size.width /4.5,


              //  horizontal: 115,
              // // vertical: 40,
            ),

            child: Image(
              image: AssetImage('images/ss.png'),
              height: MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width*0.15,


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
                print("Screen index" );
                print(_screen);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SearchDelegateField(index: _screen ,transferClass: widget.transferclass,isAsharState: sendtoAshar(_screen) ,  ),
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
                       future: _bookDetails(_screen),
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
                                      return GeneralizeClassListAshaarDetails(
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
            // new AnimatedCrossFade(
            //   firstChild: new Material(
            //     color: Theme
            //         .of(context)
            //         .primaryColor,
            //     child: new TabBar(
            //       isScrollable: true,
            //       tabs: new List.generate(tabNames.length, (index) {
            //         return new Tab(text: tabNames[index].toUpperCase());
            //       }),
            //     ),
            //   ),
            //   secondChild: new Container(),
            //   crossFadeState: _screen == 0
            //       ? CrossFadeState.showFirst
            //       : CrossFadeState.showSecond,
            //   duration: const Duration(milliseconds: 300),
            // ),
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
                      MdiIcons.homeVariant,
                      color: Colors.white,
                    ), onPressed: (){
                      _screen = widget.scrollsuperclass;
                      print("HSDGVHNVDSNVSDGNVDSBGDSCFASBGFDAHNAGSMHASMVXCX MN");
                      firstscreen =  true;
                      firstscreenIndex = true;
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => frontpageui( ),
                      ),);

                    }),
                    title: new Text('Home'),backgroundColor: Color(0xff28006e)
                ),

                new BottomNavigationBarItem(
                  icon: new Icon(Icons.multitrack_audio_outlined),
                  title: new Text('Bayanats'),backgroundColor: Color(0xff28006e)
                ),
                new BottomNavigationBarItem(
                    icon: new Icon(MdiIcons.microphoneVariant),
                    title: new Text('Ashaars'),backgroundColor: Color(0xff28006e)
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(MdiIcons.movieOpen),
                  title: new Text('Shortclips'),backgroundColor: Color(0xff28006e)
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.menu_book),
                  title: new Text('Books'),backgroundColor: Color(0xff28006e)
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
bool sendtoAshar(int _screen)
{
  if(_screen == 2)
    {
      return true;
    }else{
    return false;
  }
}
