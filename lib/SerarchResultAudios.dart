
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'GeneralizeClass.dart';
import 'GeneralizeClassListDetail.dart';


class SearchResultAudios extends StatelessWidget {

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
  int currentIndex;

  SearchResultAudios({Key key, @required this.text , this.currentIndex}) : super(key: key);
  @override
  //_searchingState createState() => _searchingState();
  bool downloading = false;
  var progressString = "";
  bool forload=false;



  Future<List<GeneralizeClass>> _bookDetails(/*text,bookdetails_*/) async {

    var data;
    var jsonData;
    if(currentIndex == 1) {
       data = await http
          .get("http://hazratkhurramabbasi.org/webservice/getHazratBayanat/1000");
       jsonData = json.decode(data.body);

       for (var hbayanval in jsonData) {

         TempBookName = hbayanval['name'].toString();
         TempBookName = TempBookName.toLowerCase();
         check = text;
         check = check.toLowerCase();
         stringlengthCheck = check.length;


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

             );
             SearchedbookList.add(bayanclips);
             break;
           }

         }

       }

    }
    else if(currentIndex == 2){
      var dataHamd = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/10/1000");
      var jsonDataHamd = json.decode(dataHamd.body);

      for (var hbayanval in jsonDataHamd) {

        TempBookName = hbayanval['name'].toString();
        TempBookName = TempBookName.toLowerCase();
        check = text;
        check = check.toLowerCase();
        stringlengthCheck = check.length;


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

                hbayanval['id_categories'],
                hbayanval['id_sub_categories']

            );
            SearchedbookList.add(bayanclips);
            break;
          }

        }
      }
      //fetching data for Naat
      var dataNaat = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/9/1000");
      var jsonDataNaat = json.decode(dataNaat.body);

      for (var hbayanval in jsonDataNaat) {

        TempBookName = hbayanval['name'].toString();
        TempBookName = TempBookName.toLowerCase();
        check = text;
        check = check.toLowerCase();
        stringlengthCheck = check.length;


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

                hbayanval['id_categories'],
                hbayanval['id_sub_categories']

            );
            SearchedbookList.add(bayanclips);
            break;
          }

        }
      }

      //fetching data for Ashar
      var dataAshar = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/8/1000");
      var jsonDataAshaar = json.decode(dataAshar.body);

      for (var hbayanval in jsonDataAshaar) { TempBookName = hbayanval['name'].toString();
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

              hbayanval['id_categories'],
              hbayanval['id_sub_categories']

          );
          SearchedbookList.add(bayanclips);
          break;
        }

      }
      }


      //fetching data for munajat
      var dataMunajat = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/11/1000");
      var jsonDataMunajat = json.decode(dataMunajat.body);

      for (var hbayanval in jsonDataMunajat) {
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



    }else if(currentIndex == 5)
      {print("in hamd");
        var dataHamd1 = await http
            .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/10/1000");
        var jsonDataHamd1 = json.decode(dataHamd1.body);

        for (var AsharNaatHamd in jsonDataHamd1) {
          booknotfound=false;
          GeneralizeClass AshaarnaatHamd = GeneralizeClass(
              AsharNaatHamd['id'],
              AsharNaatHamd['name'],
              AsharNaatHamd['audio'],
              AsharNaatHamd['status'],
              AsharNaatHamd['Date'],
              AsharNaatHamd['views'],
              AsharNaatHamd['bayan_image'],

              AsharNaatHamd['id_categories'],
              AsharNaatHamd['id_sub_categories']
          );
          SearchedbookList.add(AshaarnaatHamd);
        }

      }else if(currentIndex == 6)
    {print("in Naat"); booknotfound=false;
      var dataHamd2 = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/9/1000");
      var jsonDataHamd2 = json.decode(dataHamd2.body);

      for (var AsharNaatHamd in jsonDataHamd2) {

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
        SearchedbookList.add(AshaarnaatHamd);
      }

    }else if(currentIndex == 7)
    {
      print("in Ashar"); booknotfound=false;
      var dataHamd3 = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/8/1000");
      var jsonDataHamd3 = json.decode(dataHamd3.body);

      for (var AsharNaatHamd in jsonDataHamd3) {

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
        SearchedbookList.add(AshaarnaatHamd);
      }

    }else if(currentIndex == 8)
    {print("in manajat"); booknotfound=false;
      var dataHamd4 = await http
          .get("http://hazratkhurramabbasi.org/webservice/getSubCategoryData/11/1000");
      var jsonDataHamd4 = json.decode(dataHamd4.body);

      for (var AsharNaatHamd in jsonDataHamd4) {

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
        SearchedbookList.add(AshaarnaatHamd);
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
                      if(!booknotfound) {
                        return Expanded(
                          child: Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height,
                            color: Theme
                                .of(context)
                                .accentColor,
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




