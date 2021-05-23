import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'GeneralizeClass.dart';

import 'GeneralizeClassShortClipsDetails.dart';
class searchResultShortClips extends StatelessWidget {
  final String text;
  int stringlengthCheck;
  int stringlengthCurrentBook;
  String SubStringBook;
  String TempBookName;
  String check ;
  GeneralizeClass bookcheck;
  var temp;
  String temp1;
  bool booknotfound= true;
  List<GeneralizeClass> bookdetails = [];
  List<GeneralizeClass> SearchedbookList = [];
  //final int TotalBooksNo;
  // MyHomePage1({Key key, this.title, this.BookName}) : super(key: key);
// final String title;
  //final String BookName;
  searchResultShortClips({Key key, @required this.text}) : super(key: key);
  @override
  //_searchingState createState() => _searchingState();
  bool downloading = false;
  var progressString = "";
  // var searchString = text;



  Future<List<GeneralizeClass>> _bookDetails(/*text,bookdetails_*/) async {
    //
    var data = await http
        .get("http://hazratkhurramabbasi.org/webservice/getShortClips/1000");
    var jsonData = json.decode(data.body);



    for (var hbayanval in jsonData) {
      TempBookName = hbayanval['name'].toString();
      TempBookName = TempBookName.toLowerCase();
      check = text;
      check = check.toLowerCase();
      stringlengthCheck = check.length;
      //check = stringlengthCheck.toString();

      stringlengthCurrentBook = TempBookName.length;

      for(int i=0; i<=stringlengthCurrentBook-stringlengthCheck;i++)
      {
        SubStringBook =  TempBookName.substring(i,i+stringlengthCheck);
        if(SubStringBook == check)
        {
          booknotfound=false;
          GeneralizeClass bayanclips = GeneralizeClass(
              hbayanval['id'],
              hbayanval['name'],
              hbayanval['audio'],
              hbayanval['status'],
              hbayanval['Date'],
              hbayanval['views'],
              hbayanval['bayan_image'],
              //bookval['book_thumb'],//= bytes,
              hbayanval['id_categories'],
              hbayanval['id_sub_categories']
            //bookval['testThumb'] = Base64Encoder(MQ==);
          );
          SearchedbookList.add(bayanclips);
          break;
        }




      }

    }

    return SearchedbookList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
          preferredSize: Size.square(60.0),
          child:
          AppBar(
            title:  Padding(
              padding: EdgeInsets.only(
                left: 74,
                top: 10,

                //  horizontal: 115,
                // // vertical: 40,
              ),
              child: Image(
                image: AssetImage('images/ss.png'),
                height: 45.0,
                width: 60.0,


              ),
            ),

            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
        body:


        Column(
            children: <Widget>[
              FutureBuilder(
                  future: _bookDetails()

                  ,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data != null) {

                      if(!booknotfound)
                      {

                        return Expanded(
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            color: Theme
                                .of(context)
                                .accentColor,
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
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
                      }else
                      {

                        return Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 270.0),
                            child: Center(
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("ERROR 404\n""NOT FOUND!",
                                      style: TextStyle(
                                         fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        //height:  MediaQuery.of(context).size.height/16,
                                        color:Colors.red



                                      ),

                                    )
                                  ],
                                ),
                            ),
                          ),
                        );

                      }
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


            ]
        )



    );

  }



}



