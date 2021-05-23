import 'package:book_app/searchResultShortClips.dart';
import 'package:flutter/material.dart';
import 'SearchResultBook.dart';
import 'SerarchResultAudios.dart';



class SearchDelegateField extends StatefulWidget {

  int index;
  bool transferClass;
  bool isAsharState;
  //String text;
  SearchDelegateField({Key key, @required  this.index ,this.transferClass,this.isAsharState}) : super(key: key);
  @override
  SearchDelegateFieldState createState() {
    return SearchDelegateFieldState();
  }
}

class SearchDelegateFieldState extends State<SearchDelegateField> {


  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.square(60.0),
        child:AppBar(

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
        ),
      ),
      body:
      Center(
        child:
            Column(
              children:<Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: TextField(
                    controller: textFieldController,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),

                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    //side: BorderSide(color: Colors.black)
                  ),
                  textColor: Color(0xff28006e),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 20),

                  ),
                  onPressed: () {

                    _sendDataToSecondScreen(context);
                  },
                ),
   Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     crossAxisAlignment: CrossAxisAlignment.center,
        // shrinkWrap: true,
        //
        // crossAxisCount: 2 ,
        //
        // crossAxisSpacing: 2,
        children: <Widget>[

          Visibility (

            visible: widget.isAsharState,
             child:  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //side: BorderSide(color: Colors.black)
                    ),
                    textColor: Color(0xff28006e),
                    child: Text(
                      '\n  Hamd  \n',
                      style: TextStyle(fontSize: 20),

                    ),
                    onPressed: () {
                      Navigator.push(
                          context,//bayanat
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchResultAudios(text:" " ,currentIndex: 5, ),
                          ));

                    },
                  ),

                ),

            //   ),
            //
            // ),


          Visibility (
            visible: widget.isAsharState,

                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      //side: BorderSide(color: Colors.black)
                    ),
                    textColor: Color(0xff28006e),
                    child: Text('\n  Naat  \n',
                      style: TextStyle(fontSize: 20),

                    ),
                    onPressed: () {
                      Navigator.push(
                          context,//bayanat
                          MaterialPageRoute(
                            builder: (context) =>
                                SearchResultAudios(text:" " ,currentIndex: 6, ),
                          ));
                      },
                  ),),


        ],
      ),
                Row(
                 children:<Widget>[
                   Text("")
                 ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[   Visibility (
                    visible: widget.isAsharState,
                    child:  RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        //side: BorderSide(color: Colors.black)
                      ),
                      textColor: Color(0xff28006e),
                      child: Text(
                        '\n Ashars \n',
                        style: TextStyle(fontSize: 20),

                      ),
                      onPressed: () {
                        Navigator.push(
                            context,//bayanat
                            MaterialPageRoute(
                              builder: (context) =>
                                  SearchResultAudios(text:" " ,currentIndex: 7, ),
                            ));

                      },
                    ),),
                    Visibility (
                      visible: widget.isAsharState,
                      child:  RaisedButton(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          //side: BorderSide(color: Colors.black)
                        ),
                        textColor: Color(0xff28006e),
                        child: Text(
                          '\nMunajat\n',
                          style: TextStyle(fontSize: 20),

                        ),
                        onPressed: () {
                          Navigator.push(
                              context,//bayanat
                              MaterialPageRoute(
                                builder: (context) =>
                                    SearchResultAudios(text:" " ,currentIndex: 8, ),
                              ));

                        },
                      ),),],
                )
        ]
    )
    )
    );
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = textFieldController.text;
    // String abc;
    // abc = textToSend.substring(0,5);
    // textToSend = abc;//SearchResultBooks
    if(widget.index == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => searchResultShortClips(text: textToSend),
          ));
    }else if(widget.index == 4)
    {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultBooks(text: textToSend),
          ));

    }
    else if(widget.index == 2)
    {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultAudios(text: textToSend, currentIndex: widget.index),
          ));
    }
   else {//SearchResultAudios
      Navigator.push(
          context,//bayanat
          MaterialPageRoute(
            builder: (context) =>
                SearchResultAudios(text:textToSend ,currentIndex: widget.index, ),
          ));
    }
  }
}


