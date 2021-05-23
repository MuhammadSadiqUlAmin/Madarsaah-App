import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

// void main() => runApp(new MyApp());
// class RadioTesting extends StatelessWidget {
  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: new MyHomePage(title: 'flutter_html Example'),
//     );
//   }
// }




class RadioTesting extends StatefulWidget {
  RadioTesting({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RadioTestingState createState() => new _RadioTestingState();
}

const htmlData = """
<div id="app">
        <!-- Modal -->
        <div class="modal form_popop fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" role="document">
                    <div class="modal-content">
                        <button type="button" class="btn" style="float:right" data-dismiss="modal" aria-hidden="true"><i class="fa fa-remove"></i>Close</button>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14470.265594480528!2d67.04832763073429!3d24.946837094210196!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3eb33f64367c3ff5%3A0x1c447b4422c79806!2sKhanqah%20E%20Aarifi!5e0!3m2!1sen!2s!4v1576770347543!5m2!1sen!2s" width="100%" height="500" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal form_popop fade" id="exitApplication" tabindex="-1" role="dialog" aria-labelledby="exitApplicationLabel" aria-hidden="true">
            <div class="vertical-alignment-helper">
                <div class="modal-dialog vertical-align-center" role="document">
                    <div class="modal-content">
                        <p>Are you sure, you want to exit application?</p>
                        <div class="row">
                            <div class="col-sm-12 pull-right">
                                <button type="button" class="btn btn-dark goBack">Back</button>
                                <button type="button" class="btn btn-danger exitApp float-right">Exit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mobile_frame" style="margin: 0;">
            <div class="page_wrpr">
                <!-- Sidebar -->
                <nav class="sidebar_nav">
                    <div class="navbar_btn_div" id="closenav">
                        <button class="navbars_btn" type="button" value="`" id="sidebarCollapse">
                            <span></span>
                            <span></span>
                            <span></span>
                        </button>
                    </div>
                    <div class="sidebar-header">
                        <img src="./images/logo.png" class="logo_menu" alt="">
                    </div>
                    <div class="menu_wrpr">
                        <ul class="list-unstyled">
                            <li>
                                <a href="index.html">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="menu_icon" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff" viewBox="0 0 100 100" version="1.1" x="0px" y="0px"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><path d="M5,46.3827866 C5,34.6854586 9.44485276,24.0262816 16.7377014,16.0021124 L21.4048904,20.2410991 C15.129553,27.145637 11.3048468,36.3175578 11.3048468,46.3827866 C11.3048468,56.4468853 15.1286941,65.6178765 21.4027766,72.5221482 L16.7355876,76.7611349 C9.44399389,68.7372319 5,58.0789845 5,46.3827866 Z M78.5953035,72.5242608 C84.8705258,65.6197473 88.6951532,56.4479117 88.6951532,46.3827866 C88.6951532,36.3165313 84.8696669,27.1437663 78.5931895,20.2389867 L83.2603786,16 C90.5543671,24.0244108 95,34.6844321 95,46.3827866 C95,58.080011 90.555226,68.7391027 83.2624925,76.7632475 L78.5953035,72.5242608 Z M24.1861338,46.3827866 C24.1861338,39.5817563 26.7705468,33.3843479 31.0108618,28.7190725 L35.6780509,32.9580592 C32.455247,36.5037034 30.4909806,41.2138555 30.4909806,46.3827866 C30.4909806,51.5505876 32.4543881,56.2598101 35.6759371,59.8051882 L31.008748,64.0441749 C26.7696879,59.3791656 24.1861338,53.1826868 24.1861338,46.3827866 Z M43.0478644,46.3548735 C43.0478644,42.5156673 46.1601559,39.4033758 49.9993621,39.4033758 C53.8385683,39.4033758 56.9508599,42.5156673 56.9508599,46.3548735 C56.9508599,49.457055 54.918822,52.0846285 52.1131915,52.9791491 L58.1,83.5 L41.9,83.5 L47.8867441,52.9795352 C45.0804871,52.0853848 43.0478644,49.4575014 43.0478644,46.3548735 Z M64.3215616,59.8073007 C67.5442504,56.2616809 69.508438,51.5516141 69.508438,46.3827866 C69.508438,41.212829 67.5433913,36.5018326 64.3194475,32.9559469 L68.9866366,28.7169602 C73.2280916,33.3824772 75.8132848,39.5807298 75.8132848,46.3827866 C75.8132848,53.1837133 73.2289506,59.3810364 68.9887506,64.0462874 L64.3215616,59.8073007 Z" fill="#ffffff" fill-rule="nonzero" /></g></svg>
                                    Live broadcast
                                </a>
                            </li>
                            <li>
                                <a href="notification.html" class="help_notify_icon_btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="menu_icon" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff" xml:space="preserve" version="1.1" viewBox="0 0 6.17 6.014" x="0px" y="0px" fill-rule="evenodd" clip-rule="evenodd"><g><path d="M3.536 5.334c-0.037,0.163 -0.12,0.309 -0.234,0.424 -0.159,0.158 -0.377,0.256 -0.617,0.256 -0.24,0 -0.458,-0.098 -0.617,-0.256 -0.114,-0.115 -0.197,-0.261 -0.234,-0.424l-1.257 0c-0.159,0 -0.303,-0.065 -0.408,-0.169 -0.104,-0.104 -0.169,-0.249 -0.169,-0.408 0,-0.158 0.065,-0.303 0.169,-0.407 0.072,-0.072 0.163,-0.125 0.264,-0.151 0.068,-0.213 0.123,-0.463 0.163,-0.714 0.055,-0.335 0.084,-0.672 0.084,-0.926 0,-0.552 0.225,-1.053 0.589,-1.416 0.16,-0.16 0.346,-0.293 0.552,-0.392 0.027,-0.192 0.117,-0.364 0.247,-0.495 0.159,-0.158 0.377,-0.256 0.617,-0.256 0.24,0 0.458,0.098 0.617,0.256 0.13,0.131 0.22,0.303 0.247,0.495 0.206,0.099 0.392,0.232 0.552,0.392 0.364,0.363 0.589,0.864 0.589,1.416 0,0.254 0.029,0.591 0.084,0.926 0.04,0.251 0.095,0.501 0.163,0.714 0.101,0.026 0.192,0.079 0.264,0.151 0.104,0.104 0.169,0.249 0.169,0.407 0,0.159 -0.065,0.304 -0.169,0.408 -0.105,0.104 -0.249,0.169 -0.408,0.169l-1.257 0zm-1.661 -2.871c0,0.106 -0.086,0.192 -0.193,0.192 -0.106,0 -0.192,-0.086 -0.192,-0.192 0,-0.302 0.124,-0.577 0.323,-0.776 0.199,-0.199 0.474,-0.323 0.776,-0.323 0.106,0 0.192,0.087 0.192,0.193 0,0.106 -0.086,0.192 -0.192,0.192 -0.196,0 -0.375,0.08 -0.504,0.21 -0.13,0.129 -0.21,0.308 -0.21,0.504zm-0.062 2.487l1.744 0 1.236 0c0.053,0 0.101,-0.022 0.136,-0.057 0.035,-0.035 0.056,-0.083 0.056,-0.136 0,-0.052 -0.021,-0.1 -0.056,-0.135 -0.035,-0.035 -0.083,-0.057 -0.136,-0.057l-4.216 0c-0.053,0 -0.101,0.022 -0.136,0.057 -0.035,0.035 -0.056,0.083 -0.056,0.135 0,0.053 0.021,0.101 0.056,0.136 0.035,0.035 0.083,0.057 0.136,0.057l1.236 0zm-0.975 -0.769l3.694 0c-0.056,-0.2 -0.102,-0.417 -0.137,-0.635 -0.058,-0.359 -0.089,-0.718 -0.089,-0.987 0,-0.445 -0.183,-0.851 -0.477,-1.144 -0.293,-0.294 -0.699,-0.477 -1.144,-0.477 -0.445,0 -0.851,0.183 -1.144,0.477 -0.294,0.293 -0.477,0.699 -0.477,1.144 0,0.269 -0.031,0.628 -0.089,0.987 -0.035,0.218 -0.081,0.435 -0.137,0.635zm2.248 -3.586c-0.016,-0.025 -0.035,-0.048 -0.056,-0.068 -0.088,-0.088 -0.21,-0.142 -0.345,-0.142 -0.135,0 -0.257,0.054 -0.345,0.142 -0.021,0.02 -0.04,0.043 -0.056,0.067 0.129,-0.026 0.264,-0.04 0.401,-0.04 0.137,0 0.272,0.014 0.401,0.041zm-0.056 4.893c0.043,-0.044 0.079,-0.096 0.104,-0.154l-0.897 0c0.024,0.058 0.06,0.11 0.103,0.154 0.088,0.087 0.21,0.142 0.345,0.142 0.135,0 0.257,-0.055 0.345,-0.142z" /></g></svg>
                                    Notifications
                                    <!--<span class="notifi_count">5</span>-->
                                </a>
                            </li>
                            <li>
                                <a href="http://www.hazratkhurramabbasi.org" target="_blank" class="help_notify_icon_btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="menu_icon" fill="#ffffff" data-name="Layer 1" viewBox="0 0 100 100" x="0px" y="0px"><path d="M46.1,84.82a2.5,2.5,0,1,0,0-5H7.86A1.36,1.36,0,0,1,6.5,78.46V28.91H83.43V42.49a2.5,2.5,0,0,0,5,0V11.35A6.36,6.36,0,0,0,82.07,5H7.86A6.36,6.36,0,0,0,1.5,11.35V78.46a6.36,6.36,0,0,0,6.36,6.36ZM7.86,10H82.07a1.36,1.36,0,0,1,1.36,1.36V23.91H6.5V11.35A1.36,1.36,0,0,1,7.86,10Z" /><path d="M96.86,75.74,74.07,67.37a2.5,2.5,0,0,0-3.21,3.21l8.37,22.79A2.5,2.5,0,0,0,81.4,95h.18a2.5,2.5,0,0,0,2.2-1.32l3.45-6.42,6.17,6.17a2.5,2.5,0,0,0,3.54-3.54l-6.17-6.17,6.42-3.45a2.5,2.5,0,0,0-.32-4.55ZM82,86.42l-4.59-12.5,12.5,4.59-4.48,2.41a2.5,2.5,0,0,0-1,1Z" /><path d="M91.48,55.23,87.31,59.4a2.5,2.5,0,1,0,3.54,3.54L95,58.76a2.5,2.5,0,0,0-3.54-3.54Z" /><path d="M60.49,92.25a2.49,2.49,0,0,0,1.77-.73l4.17-4.17a2.5,2.5,0,0,0-3.54-3.54L58.73,88a2.5,2.5,0,0,0,1.77,4.27Z" /><path d="M66.43,59.4l-4.17-4.17a2.5,2.5,0,0,0-3.54,3.54l4.17,4.17a2.5,2.5,0,0,0,3.54-3.54Z" /><path d="M74.37,50.21v5.89a2.5,2.5,0,1,0,5,0V50.21a2.5,2.5,0,0,0-5,0Z" /><path d="M62.1,73.37a2.5,2.5,0,0,0-2.5-2.5H53.71a2.5,2.5,0,0,0,0,5H59.6A2.5,2.5,0,0,0,62.1,73.37Z" /><path d="M74.34,39.11a2.5,2.5,0,0,0-2.5-2.5H17.06a2.5,2.5,0,0,0-2.5,2.5v30.6a2.5,2.5,0,0,0,2.5,2.5H42.87a2.5,2.5,0,0,0,0-5H19.56V41.61H71.84A2.5,2.5,0,0,0,74.34,39.11Z" /><circle cx="14.04" cy="17.31" r="2.79" /><circle cx="23.57" cy="17.31" r="2.79" /><circle cx="33.09" cy="17.31" r="2.79" /></svg>
                                    Website
                                </a>
                            </li>
                            <li>
                                <a data-toggle="modal" data-target="#exampleModal" href="">
                                    <!--<svg xmlns="http://www.w3.org/2000/svg" class="menu_icon" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" xml:space="preserve"><path d="M85.7,15.5H14.3c-5.4,0-9.8,4.4-9.8,9.9v49.2c0,5.5,4.4,9.9,9.8,9.9h71.4c5.4,0,9.8-4.4,9.8-9.9V25.4  C95.5,19.9,91.1,15.5,85.7,15.5z M90.2,26.6v48c0,0.5-0.1,0.9-0.2,1.3L66.6,45.7L90.2,26.6z M37.7,49.1l10.8,8.8  c0.5,0.3,1,0.5,1.6,0.5c0.5,0,1.2-0.2,1.6-0.5l10.7-8.8l23.5,30c0,0-0.1,0-0.1,0H14.3c0,0-0.1,0-0.1,0L37.7,49.1z M12,21.5  c0.7-0.4,1.5-0.7,2.3-0.7h71.4c0.8,0,1.6,0.2,2.3,0.7L50,52.4L12,21.5z M33.4,45.7L10,75.9c-0.1-0.4-0.2-0.8-0.2-1.3v-48L33.4,45.7z  " /></svg>-->
                                    <i class="fa fa-map-marker" style="font-size:30px;margin-right:25px"></i>
                                    Address
                                </a>
                            </li>
                        </ul>
                    </div>
                    <p style="bottom:0;position:absolute;color:white;margin-left:10%">Version 3.0.0</p>
                </nav>
                <!-- Sidebar end -->
                <!-- Dark Overlay element -->
                <div class="overlay"></div>
                <div class="page_header">
                    <div class="row">
                        <div class="col-3 col-sm-3 col-md-3">
                            <div class="">
                                <a href="notification.html">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="notify_icon" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#FFFFFF" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" xml:space="preserve"><g><path d="M50,88.5c5.9,0,10.7-4.7,11-10.5H39C39.3,83.8,44.1,88.5,50,88.5z" /><path d="M69.7,39.5c0-8.6-5.4-16.3-13.1-19.2c0.2-0.7,0.4-1.5,0.4-2.2c0-3.9-3.1-7-7-7s-6.8,3.1-6.8,7c0,0.8,0.1,1.5,0.4,2.2   c-7.7,2.9-13.1,10.6-13.1,19.2c0,10.9-2.9,17.8-11.4,26.3c-4.8,4.8-0.6,9.2,6.2,9.2H50h24.9c6.8,0,11-4.4,6.2-9.2   C72.7,57.3,69.7,50.3,69.7,39.5z" /><path d="M70.8,20.5c3.1,3.2,5.5,7,7.3,11.3c0.3,0.8,1.1,1.2,1.8,1.2c0.3,0,0.5,0,0.8-0.2c1-0.4,1.5-1.6,1.1-2.6   c-2-4.8-4.7-9-8.1-12.5c-1.9-2-4.1-3.8-6.4-5.3c-0.9-0.6-2.2-0.4-2.8,0.6c-0.6,0.9-0.4,2.2,0.6,2.8C67.2,17.1,69.2,18.7,70.8,20.5z   " /><path d="M20,33c0.8,0,1.5-0.5,1.8-1.2c2.8-6.7,7.3-12.3,13-16.1c0.9-0.6,1.2-1.9,0.6-2.8c-0.6-0.9-1.9-1.2-2.8-0.6   c-6.4,4.2-11.4,10.4-14.5,17.8c-0.4,1,0.1,2.2,1.1,2.6C19.5,32.9,19.7,33,20,33z" /></g></svg>
                                </a>
                            </div>
                        </div>
                        <div class="col-6 col-sm-6 col-md-6">
                            <div class="header_logo_div">
                                <img src="./images/header_logo_white.png" class="header_logo" alt="">
                            </div>
                        </div>
                        <div class="col-3 col-sm-3 col-md-3">
                            <div class="navbar_btn_div">
                                <button class="navbars_btn" type="button" value="`" id="sidebarmenuopen">
                                    <span>&nbsp;</span>
                                    <span>&nbsp;</span>
                                    <span>&nbsp;</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page_inner_wrpr white_bg valgin_center forfullheight">
                    <div class="valgininer_centerdiv">
                        <div class="livebayan_screen_logo">
                            <img src="./images/1.png" class="img-fluid" alt="">
                        </div>
                        <div class="livebayan_screen_logo">
                            <img src="./images/2.png" class="img-fluid" alt="">
                        </div>
                        <img src="./images/3.png" class="img-fluid" alt="">
                        <p class="status_para text-center">Status: </p>
                        <div class="audio_ui_div">
                            <div id="player2-container">
                                <div class="media-wrapper">
                                    <audio class="player2" preload="none" controls style="max-width: 100%;">
                                        <source src="" type="audio/mp3">
                                    </audio>
                                </div>
                            </div>
                        </div>
                        <button class="primary_button reconnect">Reconnect</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="scripts/index.js"></script>

""";

class _RadioTestingState extends State<RadioTesting> {
  String ggghh="http://hazratkhurramabbasi.org/uploads/bayanat/1609.mp3";
  @override
  void dispose() {
    // TODO: implement dispose
    Html(data: //htmlData
    """vid.pause();

         
          
          """


    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: //htmlData
          """
          <audio controls>
        <source src="http://hazratkhurramabbasi.org/uploads/bayanat/1609.mp3" />
      </audio>
       var vid = document.getElementById("Audio");
          """
          ,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.black12,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),            "td": Style(

              padding: EdgeInsets.all(6),
              alignment: Alignment.topLeft,
            ),
            "var": Style(fontFamily: 'serif'),
          },
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
      ),
    );
  }
}

