import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';


class PdfViewerBooks extends StatefulWidget {
  String URL;
  PdfViewerBooks({Key key, @required this.URL}) : super(key: key);
 // PdfViewerBooks(URL);
  @override
  _PdfViewerBooksState createState() => _PdfViewerBooksState();
}

class _PdfViewerBooksState extends State<PdfViewerBooks> {
  @override
  Widget build(BuildContext context) {
    print("in pdf function "+ widget.URL);
    return Scaffold(
      body: Center(

        child: PDF.network(
          // file url
          widget.URL,
          // optional height and width
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width ,
        ),

      ),
    );
  }
}
