
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'GeneralizeClass.dart';
import 'GeneralizeClassImageDetail.dart';

class SearchResultBooks extends StatelessWidget {
  final String text;
  int stringlengthCheck;
  int stringlengthCurrentBook;
  String SubStringBook;
  String TempBookName;
  String check;

 // bayanatsshortclips bookcheck;
  var temp;
  String temp1;
  bool booknotfound = true;
  List<GeneralizeClass> bookdetails = [];
  List<GeneralizeClass> SearchedbookList = [];

  //final int TotalBooksNo;
  // MyHomePage1({Key key, this.title, this.BookName}) : super(key: key);
// final String title;
  //final String BookName;
  SearchResultBooks({Key key, @required this.text}) : super(key: key);
  @override
  //_searchingState createState() => _searchingState();
  bool downloading = false;
  var progressString = "";

  // var searchString = text;


  Future<List<GeneralizeClass>> _bookDetails(/*text,bookdetails_*/) async {

    //
    var data = await http
        .get("http://hazratkhurramabbasi.org/webservice/getBooks/1000");
    var jsonData = json.decode(data.body);


    for (var bookval in jsonData) {
      TempBookName = bookval['name'].toString();
      TempBookName = TempBookName.toLowerCase();
      check = text;
      check = check.toLowerCase();
      stringlengthCheck = check.length;
      //check = stringlengthCheck.toString();

      stringlengthCurrentBook = TempBookName.length;

      for (int i = 0; i <= stringlengthCurrentBook - stringlengthCheck; i++) {
        SubStringBook = TempBookName.substring(i, i + stringlengthCheck);
        if (SubStringBook == check) {
          booknotfound = false;
          GeneralizeClass bayanclips = GeneralizeClass(
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
        appBar: PreferredSize(
          preferredSize: Size.square(60.0),
          child:
          AppBar(
            title: Padding(
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

            backgroundColor: Theme
                .of(context)
                .primaryColor,
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
                      if (!booknotfound) {
                        return Expanded(
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            //width: 500,
                            color: Theme
                                .of(context)
                                .accentColor,
                            child: GridView.builder(

                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
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
                      }else
                      {

                        return Container(
                          child: Padding(
                            padding: EdgeInsets.only(top: 270.0),
                            child: Center(
                                child:  Text("ERROR 404\n""NOT FOUND!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      //height:  MediaQuery.of(context).size.height/16,
                                      color:Colors.red



                                  ),

                                )
                            ),
                          ),
                        );

                      }

                    }else {
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