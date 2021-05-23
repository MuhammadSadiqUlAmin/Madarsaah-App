
import 'package:book_app/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';


import 'package:flutter/services.dart';






void main()async {





  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: false // optional: set false to disable printing logs to console
  );



      runApp(MyApp());
}
class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(

    title: "books",
      theme: ThemeData(
        primaryColor: Color(0xff28006e),
        accentColor: Color(0xffffffff),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


